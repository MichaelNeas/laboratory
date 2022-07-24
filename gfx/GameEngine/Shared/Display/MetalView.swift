import MetalKit
import SwiftUI

struct MetalView: NSViewRepresentable {
    init () {
        Engine.Ignite(device: MTLCreateSystemDefaultDevice()!)
    }
    
    func makeCoordinator() -> Coordinator {
        Coordinator(self)
    }
    
    func makeNSView(context: NSViewRepresentableContext<MetalView>) -> MTKView {
        let gameView = MTKView()
        gameView.device = Engine.Device
        gameView.delegate = context.coordinator
        gameView.clearColor = Preferences.ClearColor
        gameView.colorPixelFormat = Preferences.PixelFormat
        return gameView
    }
    
    func updateNSView(_ nsView: MTKView, context: NSViewRepresentableContext<MetalView>) {}
    
    class Coordinator : Renderer {
        var parent: MetalView

        init(_ parent: MetalView) {
            self.parent = parent
            super.init(player: Player())
        }
    }
}
