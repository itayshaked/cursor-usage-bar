import SwiftUI

/// Loads the bundled Cursor/Claude app icons (from Resources/) as SwiftUI Images.
enum BrandIcon {
    /// Full-color app icons, for the dropdown section headers.
    static let cursor = image(named: "cursor-icon", size: 32)
    static let claude = image(named: "claude-icon", size: 32)

    /// Monochrome silhouettes (isTemplate), for the menu bar itself — matches
    /// the black/white glyph style of the other status bar icons instead of
    /// standing out as a colorful square.
    static let cursorTemplate = image(named: "cursor-icon-template", size: 16, template: true)
    static let claudeTemplate = image(named: "claude-icon-template", size: 16, template: true)

    private static func image(named name: String, size: CGFloat, template: Bool = false) -> Image {
        guard let url = Bundle.module.url(forResource: name, withExtension: "png", subdirectory: "Resources"),
              let nsImage = NSImage(contentsOf: url) else {
            return Image(systemName: "app")
        }
        // AppKit measures status-bar buttons off NSImage.size, not SwiftUI's
        // .frame() — the source PNGs are much larger, so without this the
        // menu bar item balloons to that size. Constrain it here at the source.
        nsImage.size = NSSize(width: size, height: size)
        nsImage.isTemplate = template
        return Image(nsImage: nsImage)
    }
}
