# Technical lessons from the Langfuse menu bar app

Read for stateful menu bar utilities, dashboards, and changing status titles. Langfuse is used here solely as a technical case study, not a visual-design reference. Do not emulate its layout, palette, cards, density, typography, or other visual treatments. Use Apple HIG and the current task to make design decisions.

The following are technical observations, not universal Apple requirements. Inspected 2026-09-15; code and planning documents do not prove current runtime correctness.

## Technical evidence

| Evidence | Technical lesson |
|---|---|
| `LangfuseMenubarApp.swift` declares a window-style extra, Settings, and a separate Usage Insights window. | These scene types can coexist. Decide which are appropriate for the new task independently. |
| The same file uses monospaced digits and a title-keyed identity with a comment about truncation after title growth. | Exercise short-to-long status labels on the target OS. This workaround is project evidence, not a universal prescription. |
| `KIMI_UI_BRIEF.md` specifies coordinated Settings/Insights lifecycle; the app file calls a shared activation controller. | Track window ownership centrally when changing activation policy. Closing one window must not disrupt another. Test the actual controller behavior. |
| `InsightsTheme.swift` distinguishes measured zero, unknown history, future cells, and source states. | Preserve those semantic distinctions through the presentation contract; choose a new visual encoding for the current app. |
| `DASHBOARD_EXPANSION_PLAN.md` documents daily aggregation and separate model/project totals as limitations. | UI filter and granularity capabilities must match the available data. A planned feature is not proof of implementation. |

Do not inherit the previous app's numbers, appearance constants, or navigation. The useful evidence is in scene integration, state semantics, and data capabilities.

## Data and state contracts

Make every displayed measure explainable by unit, scope, period, and freshness. “29%” needs used/remaining and an identifiable quota window; “8.5M” needs a unit. Keep unavailable, measured zero, stale, and partial distinct. A countdown reaching zero does not prove the underlying quota has refreshed.

If offering configurable menu bar metrics, provide a preview and preserve explicit choices. An unavailable selected metric should explain its absence rather than silently become a different metric. Keep menu bar selection independent of dashboard filters unless the user explicitly chooses linked behavior. A display preference should not start duplicate polling.

For dashboards, use a shared query state so filters, totals, trend, and details agree. Distinguish hiding a chart series from filtering the data; disclose when visible totals differ. Use stable category identities for colors and provide names/selection cues. Do not use randomized process hashes for persistent color assignment.

Increase time resolution only when the underlying observations support it. Daily aggregates cannot manufacture hourly detail, and separate model/project totals cannot establish their intersection. Show unsupported coverage honestly. Handle current/future intervals, timezone boundaries, and repeated local hours when designing time-based views.

Provide exact values and provenance through a bounded detail surface. Hover can preview; keyboard selection and click can expose the same content persistently. Keep a table alternative for dense charts. Preserve or clear selection intentionally when queries change; avoid accidental filters from merely inspecting a point.

The Devin investigation illustrates a semantic boundary: a field containing “tokens” in its name is not sufficient evidence of billed usage. The inspected project docs keep that measure unavailable without a verified counter. Generalize this to all providers: label supported measures accurately rather than promising visual parity that the data cannot support.

## Public technical provenance

Technical case study: [WXK-AI/langfuse-menubar](https://github.com/WXK-AI/langfuse-menubar), inspected 2026-09-15. File names above identify the inspected source and planning artifacts; files may evolve after that date. Reinspect the current source before applying a workaround or asserting that a capability has shipped.

This reference is self-contained. It does not require access to another repository, account, or local installation. No example interface in this repository reproduces Langfuse's visual design.
