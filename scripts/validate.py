#!/usr/bin/env python3
"""Validate the public skill package and installer with no network access."""
from pathlib import Path
import re
import subprocess
import sys
import tempfile
import xml.etree.ElementTree as ET
import struct
import zlib
import yaml

ROOT = Path(__file__).resolve().parents[1]
SKILL = ROOT / 'skills/apple-menubar-design'


def check(condition, message):
    if not condition:
        raise ValueError(message)


def main():
    text = (SKILL / 'SKILL.md').read_text()
    parts = text.split('---', 2)
    check(len(parts) == 3 and not parts[0].strip(), 'Missing YAML frontmatter')
    meta = yaml.safe_load(parts[1])
    check(meta['name'] == SKILL.name, 'Skill name does not match folder')
    check(isinstance(meta['description'], str) and bool(meta['description'].strip()), 'Missing description')
    interface = yaml.safe_load((SKILL / 'agents/openai.yaml').read_text())['interface']
    check(25 <= len(interface['short_description']) <= 64, 'UI description length')
    for path in [ROOT / 'README.md', ROOT / 'CONTRIBUTING.md', *SKILL.rglob('*.md')]:
        content = path.read_text()
        check('/Users/' not in content and '/Volumes/' not in content, f'Personal path: {path}')
        for link in re.findall(r'\]\(([^)]+)\)', content) + re.findall(r'(?:src|srcset)="([^"]+)"', content):
            if link.startswith(('http://', 'https://', '#', 'mailto:')):
                continue
            check((path.parent / link.split('#')[0]).is_file(), f'Broken link in {path}: {link}')
    for name in ['cover.svg', 'window-light.png', 'window-dark.png', 'quick-access-light.png', 'quick-access-dark.png']:
        path = ROOT / 'docs/images' / name
        data = path.read_bytes()
        if name.endswith('.svg'):
            ET.fromstring(data)
        else:
            check(data[:8] == b'\x89PNG\r\n\x1a\n', f'Invalid PNG: {name}')
            offset = 8
            seen_end = False
            while offset < len(data):
                length = struct.unpack('>I', data[offset:offset+4])[0]
                kind = data[offset+4:offset+8]
                payload = data[offset+8:offset+8+length]
                crc = struct.unpack('>I', data[offset+8+length:offset+12+length])[0]
                check(zlib.crc32(kind + payload) & 0xffffffff == crc, f'PNG CRC: {name}')
                offset += length + 12
                if kind == b'IEND':
                    seen_end = True
                    break
            check(seen_end, f'Incomplete PNG: {name}')
    with tempfile.TemporaryDirectory() as temporary:
        command = [sys.executable, str(ROOT / 'scripts/install.py'), '--dest', temporary]
        subprocess.run(command, check=True, capture_output=True)
        installed = Path(temporary) / SKILL.name
        for original in SKILL.rglob('*'):
            if original.is_file():
                check((installed / original.relative_to(SKILL)).read_bytes() == original.read_bytes(), 'Install copy differs')
        sentinel = installed / 'local-note.txt'
        sentinel.write_text('preserve existing work')
        second = subprocess.run(command, capture_output=True)
        check(second.returncode != 0 and sentinel.read_text() == 'preserve existing work', 'Installer overwrote existing data')
    print('PASS: metadata, local links, public paths, image integrity, installation, and overwrite protection')


if __name__ == '__main__':
    main()
