import MetalKit

enum ClearColors {
    static let `default` = MTLClearColor(red: 0.50, green: 0.48, blue: 0.80, alpha: 1)
}

enum Preferences {
    static var ClearColor: MTLClearColor = ClearColors.default
    static var PixelFormat: MTLPixelFormat = .bgra8Unorm
    static var DepthPixelFormat: MTLPixelFormat = .depth32Float
}
