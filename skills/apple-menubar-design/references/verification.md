# Verification by changed behavior

Select relevant checks; do not turn a small edit into a full application audit.

## Appearance or layout

Render the affected surface at its normal and smallest supported size, in light and dark appearances. Exercise long localized labels, large numbers, unavailable values, and enough rows/notices to overflow. Inspect essential labels, units, focus indicators, chart axes, clipping, material legibility, and reachable actions. Adjust layout before compressing essential text.

For nontrivial custom materials or controls, also inspect Increase Contrast, Reduce Transparency, and Reduce Motion. Verify enlarging text where supported. A screenshot alone cannot establish semantic accessibility.

## Menu bar or lifecycle

Launch, open, dismiss, reopen, and quit through the intended routes. Test outside-click/Escape and keyboard operation as applicable. Exercise title growth and selected/unselected icon appearance. For changed positioning, test screen edges, multiple displays, and full-screen/auto-hidden menu bars where available.

Open Settings and the companion window in both orders, close either first, then reopen. Check focus, background persistence, Dock/app-switcher behavior, duplicate windows, and cleanup of custom event monitors. Do not change system-wide settings merely to run a test without appropriate authorization.

## State and data

Use labeled fixtures for loading, empty, stale, partial, disconnected, and errors actually supported by the feature. Check recovery without discarding useful prior data or showing it as fresh. For interactive charts, reconcile a selected bucket and detail view to the same known fixture; verify filter changes and keyboard equivalents. Never present demo numbers as live results.

## Implementation and delivery

Build the relevant target and run focused tests for changed logic, particularly lifecycle or state transitions. Check API availability against the deployment target; a successful build with a newer SDK alone does not prove old-OS runtime support. Do not add tests that only assert cosmetic constants or copied wording.

Record which surfaces, sizes, states, OS/SDK, and interactions were actually verified. If no runnable macOS target or UI automation is available, distinguish source review, compilation, mockup inspection, and untested runtime behavior. For design reviews, report evidence, user consequence, and a concrete correction; do not issue an invented “HIG compliance score.”
