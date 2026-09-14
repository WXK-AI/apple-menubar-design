# Primary sources and freshness

Apple sources inspected 2026-09-15. This skill is an original, scoped synthesis, not a mirror of the HIG. Recheck the relevant source when an OS-specific visual treatment, API behavior, or availability affects the task. No need to reread the entire HIG for a routine edit.

## Design sources

- [HIG home](https://developer.apple.com/design/human-interface-guidelines/)
- [The menu bar](https://developer.apple.com/design/human-interface-guidelines/the-menu-bar): extra visibility, menu preference, user control, app menus.
- [Menus](https://developer.apple.com/design/human-interface-guidelines/menus): labeling, groups, state, icons, and submenus.
- [Popovers](https://developer.apple.com/design/human-interface-guidelines/popovers): transient work, dismissal, nesting, and preservation of edits.
- [Designing for macOS](https://developer.apple.com/design/human-interface-guidelines/designing-for-macos): desktop input, multitasking, and window behavior.
- [Windows](https://developer.apple.com/design/human-interface-guidelines/windows) and [Toolbars](https://developer.apple.com/design/human-interface-guidelines/toolbars): native structure and actions.
- [Settings](https://developer.apple.com/design/human-interface-guidelines/settings): global preferences and expected access.
- [Typography](https://developer.apple.com/design/human-interface-guidelines/typography), [Color](https://developer.apple.com/design/human-interface-guidelines/color), [Materials](https://developer.apple.com/design/human-interface-guidelines/materials), [SF Symbols](https://developer.apple.com/design/human-interface-guidelines/sf-symbols): appearance and availability considerations.
- [Accessibility](https://developer.apple.com/design/human-interface-guidelines/accessibility): perceivability and operability.

## Implementation sources

- [MenuBarExtra](https://developer.apple.com/documentation/swiftui/menubarextra): macOS 13+, menu-bar-only lifecycle, `LSUIElement`, rich style.
- [Window menu bar style](https://developer.apple.com/documentation/swiftui/menubarextrastyle/window): popover-like presentation.
- [SettingsLink](https://developer.apple.com/documentation/swiftui/settingslink): macOS 14+.
- [NSStatusItem](https://developer.apple.com/documentation/appkit/nsstatusitem) and [NSPopover](https://developer.apple.com/documentation/appkit/nspopover): explicit AppKit control.
- [SwiftUI windows](https://developer.apple.com/documentation/swiftui/windows): scene structure and window configuration.
- [Applying Liquid Glass](https://developer.apple.com/documentation/swiftui/applying-liquid-glass-to-custom-views): current custom effects; check availability per symbol.

## Retrieving Apple's documentation

If a page returns only a JavaScript shell, use a browser or Apple's DocC JSON representation. For example, the menu-bar HIG text was accessible at:
`https://developer.apple.com/tutorials/data/design/human-interface-guidelines/the-menu-bar.json`

An API example is:
`https://developer.apple.com/tutorials/data/documentation/swiftui/menubarextra.json`

These retrieval paths are an observed mechanism, not a promised stable API. Read `primaryContentSections`, resolve referenced titles where needed, and inspect `metadata.platforms` for symbol availability. Cite the human-readable canonical page. A successful HTTP response alone does not verify that a page contains the claimed guidance. If the mechanism changes, use Apple's site search; do not substitute an unverified third-party summary.
