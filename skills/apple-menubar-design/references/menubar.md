# Menu bar surfaces and lifecycle

Read for status items, menu bar utilities, and companion-window behavior.

## Choosing the extra

Apple's menu bar guidance favors compact symbol-based identity, user control over showing an extra, and alternative access because the system can hide extras. Use a monochrome template image or appropriate symbol that adapts to selection and appearance. Do not assume a fixed screen position or guaranteed visibility. The documented menu bar height is not an icon drawing size or a guarantee for every display configuration. [HIG: The menu bar](https://developer.apple.com/design/human-interface-guidelines/the-menu-bar)

For a regular app, offer control over the extra in Settings when appropriate. For a menu-bar-only app, explicitly design launch, removal, relaunch, Settings, and Quit rather than prescribing a Dock menu the app cannot expose. A launch-at-login preference should clearly describe background launch behavior and follow the user's choice.

## Native menu

Use action labels, logical groups, restrained separators, and native checkmarks for current selections. Clarify whether a label describes a state or the action that changes it: “Pause Sync” is less ambiguous than “Sync On.” Preserve familiar shortcuts and disable temporarily unavailable commands instead of unpredictably moving them. Use ellipses when additional input is required; follow standard labels such as Settings…. Use icons when they clarify meaning and treat each group consistently. Avoid deep submenus. [HIG: Menus](https://developer.apple.com/design/human-interface-guidelines/menus)

Keep standard command menus where the app exposes a normal menu system. A status-item menu is not a reason to synthesize File/Edit/Window menus inside the extra.

## Rich quick-access surface

Choose a rich extra for actual controls or data that a menu cannot represent well. Present the main status, the next useful action, and a route to deeper work. Derive dimensions from content, readable controls, localization, and available screen space. There is no universal 320/360/400-point width.

Prefer a transient surface for quick tasks; use a companion window when work must remain visible across app switching. Avoid nested popovers and do not discard edits on incidental dismissal. Where multiple selections are expected, keep the surface available until dismissal. A Close/Done action should clarify task completion, not duplicate dismissal without purpose. [HIG: Popovers](https://developer.apple.com/design/human-interface-guidelines/popovers)

Decide which actions dismiss, which keep the surface open, and how Settings or a companion window receives focus. Verify actual outside-click and Escape behavior for the chosen API; SwiftUI's window-style extra is described as popover-like, not guaranteed to expose every NSPopover feature.

## Implementation choices

- `MenuBarExtra` is available from macOS 13. Its menu style suits commands; `.menuBarExtraStyle(.window)` supports richer layouts. For menu-bar-only apps, removal of the extra terminates the app. `LSUIElement` enables absence from the Dock/app switcher; it is a product choice, not mandatory for every app with an extra. [MenuBarExtra](https://developer.apple.com/documentation/swiftui/menubarextra)
- `SettingsLink` opens the declared Settings scene and starts at macOS 14. Gate it for older targets; research and test the supported fallback rather than assuming a selector works everywhere. [SettingsLink](https://developer.apple.com/documentation/swiftui/settingslink)
- Use AppKit when an older target or concrete interaction requirement calls for explicit control. Retain the status item and manage associated presentation and event-monitor lifetimes. [NSStatusItem](https://developer.apple.com/documentation/appkit/nsstatusitem), [NSPopover](https://developer.apple.com/documentation/appkit/nspopover)

Treat activation policy separately from styling. Test opening and closing Settings and companion windows in either order. Closing the last window should follow the utility's intended background lifecycle. Showing a Dock icon while a window is open is one possible product decision, not a universal HIG requirement. Do not steal focus during background refresh.

For numeric titles, keep units and state understandable, offer icon-only when useful, and bound the width. Test transitions from short to long values, unavailable to available, and large localized numbers. Monospaced digits help stability but do not guarantee status-item remeasurement. Apply a remeasurement workaround only after reproducing the need on the supported runtime.
