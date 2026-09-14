# Contributing

Keep the skill focused on native macOS interface work. Prefer a small correction backed by evidence over a broad collection of design rules.

For Apple guidance, link the canonical page and identify the relevant platform or OS version. For technical behavior, include the target macOS/SDK, a minimal reproduction, and the observed result. Screenshots can support visual findings; they cannot establish keyboard or VoiceOver behavior.

Keep detailed conditional guidance in `references/` and link it from the entrypoint. Do not add personal paths, private project history, account values, or unlicensed artwork. Langfuse is a technical case study only; do not promote it as a visual-design template.

Before opening a pull request:

1. Run `python3 scripts/validate.py` with `requirements-dev.txt` installed.
2. Explain the user-facing benefit and the evidence for the change.
3. Identify any remaining runtime or visual verification limits.

If you change the visual examples, inspect both appearances and keep their provenance accurate. Generated mockups must be labeled as such; only call an image a macOS 27 screenshot if it was actually captured on that OS. Follow `docs/VISUALS.md` and current Apple references. Do not recreate legacy system styling just because an older runtime is available.
