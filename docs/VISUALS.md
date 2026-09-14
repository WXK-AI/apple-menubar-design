# macOS 27 visual direction

## Source foundation

Checked September 15, 2026:

- [Apple's macOS 27 overview](https://www.apple.com/os/macos/) supplies the current visual reference and describes refined glass, readability, toolbars, and window/sidebar changes.
- [WWDC26 Platforms State of the Union](https://developer.apple.com/videos/play/wwdc2026/102/) explains the stronger optical edges and sidebar refinements.
- [HIG: Materials](https://developer.apple.com/design/human-interface-guidelines/materials) distinguishes the functional glass layer from the content layer.
- [Apple Design Resources](https://developer.apple.com/design/resources/) provides versioned design kits.

The original previews were rendered on macOS 15.7.5. They have been removed from the current repository because they did not represent the requested macOS 27 direction. The current images are generated design studies, not captures of a macOS 27 runtime.

## Production

Images were made with the built-in image-generation tool. Apple's published material examples were supplied as style references only; their Mail interface was not used as the example app. The artwork uses a fictional utility, Quiet Sync, with a companion window and compact menu bar extra. No Langfuse design imagery was used.

Files:

- `images/macos27-light.png` — light appearance, platinum/blue environment.
- `images/macos27-dark.png` — matching dark appearance, charcoal/blue environment.

Both were inspected for readable labels, consistent composition, matching timestamps, coherent state, and appearance differences. They do not prove contrast ratios, system dimensions, keyboard operation, or API correctness.

## Prompt specification

The light generation brief specified a straight-on landscape desktop view, with a companion window at center-left and an extra anchored under a selected sync icon at upper-right. It requested macOS 27 Liquid Glass based on Apple's supplied references: translucent navigation with a brighter specular rim and darker edge; pill-shaped grouped controls; a continuous sidebar; standard window controls; an opaque, nearly-white content area; restrained separators and blue action/selection accents.

Exact app copy requested: “Quiet Sync,” “Overview,” “Folders,” “Activity,” “Everything is up to date,” “All changes synced,” “Design Library,” “Project Notes,” “Shared Resources,” “128 files,” “42 files,” “16 files,” “Up to date,” “Last synced at 10:42 AM,” “3 folders connected,” “Next sync in 2 min,” “Sync Now,” “Pause,” “Open Overview,” and “Settings…”. A follow-up edit aligned the desktop clock to 10:42 AM.

The dark edit preserved composition, hierarchy, labels, and timestamps. It requested smoky translucent navigation, restrained blue environmental refraction, an opaque charcoal content area, white primary text, legible silver secondary text, and the same action/status accents. The brief excluded neon effects, exaggerated blur, decorative glass content cards, laptop frames, watermarks, and external marketing captions.

## Reading the examples

These are material and hierarchy studies, not a complete app specification. The illustrated simple utility could use a native menu. A production window-style extra needs a concrete reason, such as controls or inspection tasks that a menu cannot adequately express. The skill's surface-selection guidance still applies.

For future revisions, use the current requested OS as the source of visual truth. Do not describe generated images as native captures, and do not let the available host OS silently determine a different target style.
