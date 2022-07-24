import MetalKit

class Renderer: NSObject {
    let gameObject: GameObject
    
    init(gameObject: GameObject) {
        self.gameObject = gameObject
    }
}

extension Renderer: MTKViewDelegate {
    // when window is resized
    func mtkView(_ view: MTKView, drawableSizeWillChange size: CGSize) {
        
    }
    
    func draw(in view: MTKView) {
        guard let drawable = view.currentDrawable,
              let renderPassDescriptor = view.currentRenderPassDescriptor else { return }
        
        let commandBuffer = Engine.CommandQueue.makeCommandBuffer()!
        let renderCommandEncoder = commandBuffer.makeRenderCommandEncoder(descriptor: renderPassDescriptor)!
        gameObject.render(renderCommandEncoder: renderCommandEncoder)
        
        renderCommandEncoder.endEncoding()
        commandBuffer.present(drawable)
        commandBuffer.commit()
    }
}
