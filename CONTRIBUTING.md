# Contributing

Keep the skill focused on native macOS interface work. Prefer a small correction backed by evidence over a broad collection of design rules.

For Apple guidance, link the canonical page and identify the relevant platform or OS version. For technical behavior, include the target macOS/SDK, a minimal reproduction, and the observed result. Screenshots can support visual findings; they cannot establish keyboard or VoiceOver behavior.

Keep detailed conditional guidance in `references/` and link it from the entrypoint. Do not add personal paths, private project history, account values, or unlicensed artwork. Langfuse is a technical case study only; do not promote it as a visual-design template.

Before opening a pull request:

1. Run `python3 scripts/validate.py` with `requirements-dev.txt` installed.
2. Explain the user-facing benefit and the evidence for the change.
3. Identify any remaining runtime or visual verification limits.

If you change the native preview, regenerate and inspect its light/dark captures on macOS. These are deliberately static fixtures, not a complete utility app. Do not add live data or network access to them.
