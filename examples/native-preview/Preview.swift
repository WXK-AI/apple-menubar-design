// Original, fictional documentation fixture. No network, account, or file-sync operations.
// Run: swift examples/native-preview/Preview.swift docs/images
import AppKit

final class Canvas: NSView {
    override var isFlipped: Bool { true }
}
func label(_ text: String, _ x: CGFloat, _ y: CGFloat, _ width: CGFloat,
           _ size: CGFloat = 13, _ weight: NSFont.Weight = .regular,
           _ color: NSColor = .labelColor) -> NSTextField {
    let view = NSTextField(labelWithString: text)
    view.font = .systemFont(ofSize: size, weight: weight)
    view.textColor = color
    view.frame = NSRect(x: x, y: y, width: width, height: size * 1.6 + 4)
    return view
}
func button(_ text: String, _ x: CGFloat, _ y: CGFloat, _ width: CGFloat) -> NSButton {
    let view = NSButton(title: text, target: nil, action: nil)
    view.bezelStyle = .rounded
    view.frame = NSRect(x: x, y: y, width: width, height: 32)
    return view
}
func line(_ x: CGFloat, _ y: CGFloat, _ width: CGFloat) -> NSBox {
    let view = NSBox(frame: NSRect(x: x, y: y, width: width, height: 1))
    view.boxType = .separator
    return view
}
func symbol(_ name: String, _ x: CGFloat, _ y: CGFloat, color: NSColor = .secondaryLabelColor) -> NSImageView {
    let view = NSImageView(frame: NSRect(x: x, y: y, width: 20, height: 20))
    view.image = NSImage(systemSymbolName: name, accessibilityDescription: name)
    view.contentTintColor = color
    return view
}
func windowContent() -> Canvas {
    let root = Canvas(frame: NSRect(x: 0, y: 0, width: 1060, height: 636))
    let rail = NSVisualEffectView(frame: NSRect(x: 0, y: 0, width: 208, height: 636))
    rail.material = .sidebar
    rail.blendingMode = .withinWindow
    rail.state = .active
    root.addSubview(rail)
    root.addSubview(label("QUIET SYNC", 24, 30, 160, 11, .semibold, .secondaryLabelColor))
    for (i, title) in ["Overview", "Folders", "Activity"].enumerated() {
        let y = CGFloat(74 + i * 44)
        if i == 0 {
            let selected = NSBox(frame: NSRect(x: 12, y: y - 6, width: 184, height: 36))
            selected.boxType = .custom; selected.borderWidth = 0
            selected.fillColor = .selectedContentBackgroundColor; selected.cornerRadius = 7
            root.addSubview(selected)
        }
        root.addSubview(symbol(["square.grid.2x2", "folder", "clock"][i], 26, y, color: i == 0 ? .white : .secondaryLabelColor))
        root.addSubview(label(title, 58, y - 1, 130, 13, i == 0 ? .semibold : .regular, i == 0 ? .white : .labelColor))
    }
    root.addSubview(label("LOCAL DEMO", 24, 551, 160, 10, .semibold, .secondaryLabelColor))
    root.addSubview(label("Fictional example data", 24, 577, 170, 12, .regular, .secondaryLabelColor))
    root.addSubview(label("Overview", 244, 27, 480, 27, .bold))
    root.addSubview(label("Your folders are up to date.", 244, 71, 550, 14, .regular, .secondaryLabelColor))
    root.addSubview(button("Sync Now", 893, 30, 127))
    root.addSubview(line(244, 120, 776))
    root.addSubview(symbol("checkmark.circle.fill", 245, 148, color: .systemGreen))
    root.addSubview(label("All changes synced", 275, 145, 420, 17, .semibold))
    root.addSubview(label("Last successful sync · Today at 10:42 AM", 275, 180, 630, 13, .regular, .secondaryLabelColor))
    root.addSubview(label("FOLDERS", 244, 247, 400, 11, .semibold, .secondaryLabelColor))
    root.addSubview(label("3 connected", 883, 247, 150, 12, .regular, .secondaryLabelColor))
    let rows = [("Design Library", "128 files · Updated just now", "Up to date"),
                ("Project Notes", "42 files · Updated 2 minutes ago", "Up to date"),
                ("Shared Resources", "16 files · Updated 8 minutes ago", "Up to date")]
    for (i, row) in rows.enumerated() {
        let y = CGFloat(293 + i * 84)
        root.addSubview(symbol("folder", 245, y + 4, color: .controlAccentColor))
        root.addSubview(label(row.0, 280, y, 455, 14, .medium))
        root.addSubview(label(row.1, 280, y + 27, 455, 12, .regular, .secondaryLabelColor))
        root.addSubview(label(row.2, 906, y + 10, 110, 12, .regular, .secondaryLabelColor))
        root.addSubview(line(244, y + 65, 776))
    }
    root.addSubview(label("Automatic sync is on", 244, 579, 360, 12, .regular, .secondaryLabelColor))
    root.addSubview(button("Pause Sync", 888, 568, 132))
    return root
}
func quickContent() -> Canvas {
    let root = Canvas(frame: NSRect(x: 0, y: 0, width: 380, height: 304))
    root.addSubview(label("Quiet Sync", 22, 21, 300, 17, .semibold))
    root.addSubview(line(22, 62, 336))
    root.addSubview(symbol("checkmark.circle.fill", 22, 83, color: .systemGreen))
    root.addSubview(label("All changes synced", 53, 80, 300, 14, .medium))
    root.addSubview(label("3 folders · Updated just now", 53, 108, 300, 12, .regular, .secondaryLabelColor))
    root.addSubview(button("Sync Now", 18, 151, 163))
    root.addSubview(button("Pause Sync", 196, 151, 166))
    root.addSubview(line(22, 205, 336))
    root.addSubview(button("Open Overview", 18, 225, 182))
    root.addSubview(button("Settings…", 242, 225, 120))
    root.addSubview(label("Documentation preview · Fictional data", 24, 273, 340, 10, .regular, .secondaryLabelColor))
    return root
}
let app = NSApplication.shared
app.setActivationPolicy(.accessory)
let destination = URL(fileURLWithPath: CommandLine.arguments.dropFirst().first ?? "docs/images", isDirectory: true)
try FileManager.default.createDirectory(at: destination, withIntermediateDirectories: true)
for (name, appearance) in [("light", NSAppearance.Name.aqua), ("dark", NSAppearance.Name.darkAqua)] {
    for (kind, content) in [("window", windowContent()), ("quick-access", quickContent())] {
        let window = NSWindow(contentRect: content.bounds, styleMask: [.titled, .closable, .miniaturizable, .resizable], backing: .buffered, defer: false)
        window.title = kind == "window" ? "Quiet Sync — Documentation Preview" : "Quick Access — Documentation Preview"
        window.appearance = NSAppearance(named: appearance)
        window.contentView = content
        window.center()
        window.orderFront(nil)
        RunLoop.current.run(until: Date().addingTimeInterval(0.15))
        window.displayIfNeeded()
        guard let frame = window.contentView?.superview,
              let bitmap = frame.bitmapImageRepForCachingDisplay(in: frame.bounds) else { fatalError("Cannot create capture") }
        frame.cacheDisplay(in: frame.bounds, to: bitmap)
        guard let png = bitmap.representation(using: .png, properties: [:]) else { fatalError("Cannot encode PNG") }
        let path = destination.appendingPathComponent("\(kind)-\(name).png")
        try png.write(to: path)
        print(path.path)
        window.orderOut(nil)
    }
}
