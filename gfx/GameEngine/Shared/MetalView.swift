import MetalKit
import SwiftUI

struct MetalView: NSViewRepresentable {
    func makeCoordinator() -> Coordinator {
        Coordinator(self)
    }
    func makeNSView(context: NSViewRepresentableContext<MetalView>) -> MTKView {
        let mtkView = MTKView()
        mtkView.delegate = context.coordinator
        mtkView.preferredFramesPerSecond = 60
        mtkView.enableSetNeedsDisplay = true
        if let metalDevice = MTLCreateSystemDefaultDevice() {
            mtkView.device = metalDevice
        }
        mtkView.framebufferOnly = false
        mtkView.clearColor = MTLClearColor(red: 0, green: 0, blue: 0, alpha: 0)
        mtkView.drawableSize = mtkView.frame.size
        mtkView.enableSetNeedsDisplay = true
        return mtkView
    }
    
    func updateNSView(_ nsView: MTKView, context: NSViewRepresentableContext<MetalView>) {
    }
    
    class Coordinator : NSObject, MTKViewDelegate {
        var parent: MetalView
        var metalDevice: MTLDevice!
        var metalCommandQueue: MTLCommandQueue!
        var renderPipelineState: MTLRenderPipelineState!
        
        init(_ parent: MetalView) {
            self.parent = parent
            if let metalDevice = MTLCreateSystemDefaultDevice() {
                self.metalDevice = metalDevice
                let library = metalDevice.makeDefaultLibrary()
                let vertexFunction = library?.makeFunction(name: "basic_vertex_shader")
                let fragmentFunction = library?.makeFunction(name: "basic_fragement_shader")
                let renderPipelineDescriptor = MTLRenderPipelineDescriptor()
                renderPipelineDescriptor.vertexFunction = vertexFunction
                renderPipelineDescriptor.fragmentFunction = fragmentFunction
                renderPipelineDescriptor.colorAttachments[0].pixelFormat = .bgra8Unorm
                self.renderPipelineState = try! metalDevice.makeRenderPipelineState(descriptor: renderPipelineDescriptor)
            }
            // bgra8Unorm is most common
//            view.colorPixelFormat = .bgra8Unorm
            // compute command encoder - computational tasks, no gfx
            // blit - memory management tasks
            // parallel - multiple things at the same time
            // render - render gfx
            // cmd buffer 1 computes texture information to be drawn (compute encoder)
            // cmd buffer 2 uses texture to render (render encoder)
            self.metalCommandQueue = metalDevice.makeCommandQueue()!
            super.init()
        }
        
        func mtkView(_ view: MTKView, drawableSizeWillChange size: CGSize) {
            
        }
        
        func draw(in view: MTKView) {
            guard let drawable = view.currentDrawable else {
                return
            }
            let commandBuffer = metalCommandQueue.makeCommandBuffer()
            let rpd = view.currentRenderPassDescriptor
            rpd?.colorAttachments[0].clearColor = MTLClearColorMake(0.43, 1, 0.5, 1)
            rpd?.colorAttachments[0].loadAction = .clear
            rpd?.colorAttachments[0].storeAction = .store
            let re = commandBuffer?.makeRenderCommandEncoder(descriptor: rpd!)
            re?.setRenderPipelineState(renderPipelineState)
            re?.endEncoding()
            commandBuffer?.present(drawable)
            commandBuffer?.commit()
        }
    }
}
