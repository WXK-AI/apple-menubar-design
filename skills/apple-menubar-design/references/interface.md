# Native interface design

Read for app windows, Settings, visual design, copy, and accessibility.

## Structure follows work

Use a window for sustained work and let its layout adapt to resizing. Organize navigation around real destinations. Use a sidebar for meaningful areas, a toolbar for frequent contextual actions, and a detail area for the current selection. Avoid adding empty destinations to make a utility resemble a large product. Respect native window controls and distinguish closing a window from quitting the app. [HIG: Windows](https://developer.apple.com/design/human-interface-guidelines/windows), [Designing for macOS](https://developer.apple.com/design/human-interface-guidelines/designing-for-macos)

Choose default and minimum sizes through content tests. At narrower widths, reflow cards, wrap controls, collapse optional columns, or scroll content before shrinking type or clipping meaning. Keep navigation and key actions reachable. Distinguish a valid scrollable layout from an inaccessible action hidden below a fixed-height container. Preserve selection and context when opening details.

## Hierarchy and materials

Begin with alignment, grouping, type, and whitespace. A panel boundary should signal a meaningful group; repeated nested cards add visual weight without necessarily adding clarity. Make the primary task prominent and use restrained secondary information. Branding may inform accent and imagery without replacing every system control.

Use system fonts and semantic text styles; tune hierarchy with size and weight. Apple lists 13 pt as the macOS default and 10 pt as the minimum in its typography guidance, not as a recommendation to render all metadata at 10 pt. Check legibility at actual display scale and support enlargement where relevant. Prefer tabular digits for changing numeric values and expose exact values when abbreviating. [HIG: Typography](https://developer.apple.com/design/human-interface-guidelines/typography)

Use semantic foreground, background, selection, and separator colors so appearance and accessibility settings can adapt. Test custom accents in both appearances; a system background does not make every custom foreground accessible. Keep status identifiable through text or shape as well as color. [HIG: Color](https://developer.apple.com/design/human-interface-guidelines/color)

Use materials for their role, not a sampled wallpaper color. Apple's current guidance places Liquid Glass in the controls/navigation layer and standard materials in content. Prefer the appearance supplied by standard components; avoid applying custom glass to every card or chart. For custom glass, verify SDK/OS availability and use a suitable fallback on older targets. Check Reduce Transparency and Increase Contrast. [HIG: Materials](https://developer.apple.com/design/human-interface-guidelines/materials)

Choose SF Symbols by meaning and verify availability on the deployment target. Match weight/scale to adjacent text. Do not assume a symbol approved for interface use can become the app's logo or app icon; check Apple's usage restrictions. [HIG: SF Symbols](https://developer.apple.com/design/human-interface-guidelines/sf-symbols)

## Settings and feedback

Keep frequent task controls close to the task and infrequent global choices in Settings. Use helpful defaults and respect system preferences instead of duplicating them unnecessarily. Expose the conventional Settings command and Command-Comma in a normal app menu; provide a discoverable route from a menu-bar-only utility. Prefer the platform Settings scene when it fits. [HIG: Settings](https://developer.apple.com/design/human-interface-guidelines/settings)

Name actions by their outcome. Explain a failure with its consequence and available recovery. Use inline feedback for local recoverable issues, reserving interruptions for decisions that warrant them. Avoid stacks of repeated warnings that displace useful content. Do not call internal transport, storage, or rendering details user-facing features unless they affect a decision.

## Accessibility is interaction

Use semantic controls with meaningful names, values, state, and actions. Check VoiceOver reading order and keyboard access to child controls; do not flatten a container into one accessibility element if that hides actionable descendants. Preserve visible focus, text selection, and familiar text-editing shortcuts.

Provide an alternative to hover-only details, color-only chart categories, and motion-only feedback. Test contrast on rendered materials, appearance variants, and accessibility settings. Inspect focus and activation separately from how the UI looks. Avoid treating iOS touch-target or Dynamic Type conventions as guaranteed macOS behavior. [HIG: Accessibility](https://developer.apple.com/design/human-interface-guidelines/accessibility)

## macOS 27 visual baseline

Apple's macOS 27 overview and WWDC26 material describe stronger legibility, refined glass edges, coordinated toolbars, edge-to-edge sidebars, and accent-colored sidebar icons. Use those current references when targeting 27; do not reproduce older inset-sidebar or legacy control styling simply because the development host renders it. Keep the native content layer clear and use system components to obtain the actual behavior.

For visual work, compare against Apple's current examples before rendering. For implementation, record the SDK and runtime separately and test on the requested OS. An AI-generated mockup may communicate intent but cannot verify exact system geometry, refraction, focus behavior, or accessibility. Respect the user's contrast, transparency, and border preferences; do not bake one glass appearance into custom controls.

Sources: [macOS 27 overview](https://www.apple.com/os/macos/), [WWDC26 Platforms State of the Union](https://developer.apple.com/videos/play/wwdc2026/102/), [Apple Design Resources](https://developer.apple.com/design/resources/). Checked 2026-09-15.
