---
name: apple-menubar-design
description: Design, implement, or review native macOS menu bar utilities and app interfaces using Apple Human Interface Guidelines. Use for status items, menus, popovers, companion windows, Settings, SwiftUI/AppKit UI, and Mac interaction or visual polish. Not for generic Apple-styled websites or iOS-only interfaces.
---

# Apple Menu Bar & macOS Design

Create interfaces that behave like Mac apps and make the user's task immediately understandable. Preserve the requested product, framework, deployment target, and scope. A review produces findings; an implementation request produces working changes and relevant verification. Do not redesign unrelated surfaces or add features merely to satisfy this skill.

## Start with the interaction

From the request and relevant project files, establish the primary task, existing surfaces, minimum macOS version, and whether the app is a menu-bar-only utility or a regular app with an optional extra. Ask only about a consequential ambiguity that cannot be resolved from context. For a design-only request, state a reasonable target assumption; for code, inspect the actual target and installed SDK.

Decide which surface owns each task before styling it:

| Need | Starting choice |
|---|---|
| A few commands, toggles, or short status lines | Native menu from the status item |
| Rich quick inspection or a few related controls | Compact menu bar window/popover, with a reason a menu is insufficient |
| Comparison, history, editing, search, persistent inspection | Companion window |
| Infrequent app-wide preferences | Settings window |

Apple prefers a menu for an extra unless the exposed functionality is too complex. A rich extra is a supported exception, not an automatic mistake. Distinguish the trailing menu bar extra from the active app's leading menu system. [Apple: The menu bar](https://developer.apple.com/design/human-interface-guidelines/the-menu-bar)

## Read only what the task needs

- For any status item or menu bar utility: [Menu bar surfaces and lifecycle](references/menubar.md).
- For windows, Settings, layout, appearance, or copy: [Native interface design](references/interface.md).
- For dashboards, changing numeric labels, or lessons from Langfuse: [Technical lessons from Langfuse](references/langfuse-lessons.md). Use that app only as technical evidence, never as a visual-design exemplar.
- Before handing off changed UI: select relevant checks from [Verification](references/verification.md).
- For primary links, research freshness, and SDK lookup: [Source guide](references/sources.md).

## Design and build

Use standard controls and semantic system styles first. Introduce customization where it improves recognition or a specific task; preserve keyboard behavior, focus, accessibility, and resizing. Keep content hierarchy independent of decorative effects. Never claim that hardcoded spacing, a color palette, card count, or window dimension is an Apple requirement without a supporting source.

Specify the important states alongside the happy path. For a utility this commonly means loading, ready, empty, stale, unavailable, and recoverable failure. Include only states the feature can actually encounter. Use realistic long labels and data extremes early. Keep primary actions and the meaning of values readable before adding secondary detail.

When implementing, inspect the relevant scene, state ownership, and callers before changing behavior. Verify unfamiliar APIs and symbol availability against Apple documentation and the target SDK. Do not substitute a browser mockup for native behavior testing. If the requested deliverable is a mockup, identify interaction details that remain unimplemented.

## Evidence and completion

Treat Apple guidance, API behavior, project observations, and your design judgment as different evidence types. Apple recommendations are not automatically API restrictions or App Store rules. Resolve apparent conflicts by checking platform, OS version, and surface. If a source is unavailable, disclose that limitation instead of inventing a quotation or a fixed rule.

Validate proportionately: a text edit needs a focused check; a custom popover or window-lifecycle change needs interaction verification. Inspect rendered output when appearance changes. Report the result, material tradeoffs, and what was actually tested. Do not claim pixel perfection, full accessibility, or live-data correctness from compilation or screenshots alone.
