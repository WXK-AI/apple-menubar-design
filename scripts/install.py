#!/usr/bin/env python3
"""Install the packaged skill without overwriting an existing installation."""
import argparse
import os
from pathlib import Path
import shutil
import tempfile


def main():
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument('--dest', type=Path, help='Parent skills directory; defaults to CODEX_HOME/skills or ~/.codex/skills')
    args = parser.parse_args()
    source = Path(__file__).resolve().parents[1] / 'skills' / 'apple-menubar-design'
    parent = args.dest or Path(os.environ.get('CODEX_HOME') or Path.home() / '.codex') / 'skills'
    parent = parent.expanduser().resolve()
    target = parent / source.name
    if target.exists() or target.is_symlink():
        parser.exit(1, f'Refusing to overwrite existing installation: {target}\n')
    parent.mkdir(parents=True, exist_ok=True)
    # Prepare a complete copy before reserving the destination.
    with tempfile.TemporaryDirectory(prefix='.skill-install-', dir=parent) as temporary:
        staged = Path(temporary) / source.name
        shutil.copytree(source, staged)
        # mkdir reserves the name and also catches a competing installation.
        target.mkdir()
        try:
            for child in staged.iterdir():
                shutil.move(str(child), target / child.name)
        except Exception:
            shutil.rmtree(target)
            raise
    print(f'Installed {source.name} at {target}')
    print('Available on your next Codex turn.')


if __name__ == '__main__':
    main()
