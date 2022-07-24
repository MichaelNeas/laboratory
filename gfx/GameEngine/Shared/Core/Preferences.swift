import MetalKit

enum ClearColors {
    static let `default` = MTLClearColor(red: 0.50, green: 0.48, blue: 0.80, alpha: 1)
}

class Preferences {
    public static var ClearColor: MTLClearColor = ClearColors.default
    public static var PixelFormat: MTLPixelFormat = .bgra8Unorm
}
