import MetalKit

class Renderer: NSObject {
    static var ScreenSize: SIMD2<Float> = SIMD2<Float>(0,0)
    static var AspectRatio: Float {
        ScreenSize.x / ScreenSize.y
    }
}

extension Renderer: MTKViewDelegate {
    
    func updateScreenSize(view: MTKView) {
        Renderer.ScreenSize = SIMD2<Float>(Float(view.bounds.width), Float(view.bounds.height))
    }
    
    // when window is resized
    func mtkView(_ view: MTKView, drawableSizeWillChange size: CGSize) {
        updateScreenSize(view: view)
    }
    
    func draw(in view: MTKView) {
        guard let drawable = view.currentDrawable,
              let renderPassDescriptor = view.currentRenderPassDescriptor else { return }
        
        let commandBuffer = Engine.CommandQueue.makeCommandBuffer()!
        commandBuffer.label = "Super command buffer"
        
        let renderCommandEncoder = commandBuffer.makeRenderCommandEncoder(descriptor: renderPassDescriptor)!
        renderCommandEncoder.label = "First render command encoder"
        
        SceneManager.tickScene(renderCommandEncoder: renderCommandEncoder, deltaTime: 1 / Float(view.preferredFramesPerSecond))
        
        renderCommandEncoder.endEncoding()
        commandBuffer.present(drawable)
        commandBuffer.commit()
    }
}
