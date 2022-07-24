import MetalKit

class GameView: MTKView {
    var renderPipelineState: MTLRenderPipelineState!
    
    var vertices: [Vertex]!
    var vertexBuffer: MTLBuffer!
    
    override init(frame frameRect: CGRect, device: MTLDevice?) {
        super.init(frame: frameRect, device: device)
        
        Engine.Ignite(device: device!)
        // bgra8Unorm is most common
        // compute command encoder - computational tasks, no gfx
        // blit - memory management tasks
        // parallel - multiple things at the same time
        // render - render gfx
        // cmd buffer 1 computes texture information to be drawn (compute encoder)
        // cmd buffer 2 uses texture to render (render encoder)
        self.clearColor = Preferences.ClearColor
        self.colorPixelFormat = Preferences.PixelFormat
        createVertices()
        createBuffers()
    }
    
    required init(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    private func createVertices() {
        vertices = [
            Vertex(position: [0, 1, 0], color: [1, 0, 0, 1]),
            Vertex(position: [-1, -1, 0], color: [0, 1, 0, 1]),
            Vertex(position: [1, -1, 0], color: [0, 0, 1, 1])
        ]
    }
    
    private func createBuffers() {
        // MTLBuffer - unformatted device accessible space
        // Buffer will always have the same size
        // we want to read and write shiz
        // (0,0,0) in the middle of the screen
        vertexBuffer = device?.makeBuffer(bytes: vertices, length: Vertex.stride * vertices.count, options: [])
    }
    
    override func draw(_ dirtyRect: NSRect) {
        guard let drawable = self.currentDrawable,
                let renderPassDescriptor = currentRenderPassDescriptor else { return }
        
        let commandBuffer = Engine.CommandQueue.makeCommandBuffer()
        let renderCommandEncoder = commandBuffer?.makeRenderCommandEncoder(descriptor: renderPassDescriptor)
        
        renderCommandEncoder?.setRenderPipelineState(RenderPipelineStateLibrary.PipelineState(.Basic))
        // set buffer in device space
        renderCommandEncoder?.setVertexBuffer(vertexBuffer, offset: 0, index: 0)
        // start with the top vertice and move counter clockwise
        renderCommandEncoder?.drawPrimitives(type: .triangle, vertexStart: 0, vertexCount: vertices.count)
        
        renderCommandEncoder?.endEncoding()
        commandBuffer?.present(drawable)
        commandBuffer?.commit()
    }
}
