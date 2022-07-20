import MetalKit
import SwiftUI

struct MetalView: NSViewRepresentable {
    func makeCoordinator() -> Coordinator {
        Coordinator(self)
    }
    func makeNSView(context: NSViewRepresentableContext<MetalView>) -> MTKView {
        GameView(frame: .zero, device: MTLCreateSystemDefaultDevice())
    }
    
    func updateNSView(_ nsView: MTKView, context: NSViewRepresentableContext<MetalView>) {}
    
    class Coordinator : NSObject, MTKViewDelegate {
        var parent: MetalView

        
        init(_ parent: MetalView) {
            self.parent = parent
            super.init()
        }
        
        func mtkView(_ view: MTKView, drawableSizeWillChange size: CGSize) {}
        
        func draw(in view: MTKView) {}
    }
}


