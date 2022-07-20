import MetalKit

class GameView: MTKView {
    var metalCommandQueue: MTLCommandQueue!
    var renderPipelineState: MTLRenderPipelineState!
    
    let vertices: [SIMD3<Float>] = [
        [0, 1, 0], // top middle
        [-1, -1, 0], // bottom left
        [1, -1, 0] // bottom right
    ]
    
    var vertexBuffer: MTLBuffer!
    
    override init(frame frameRect: CGRect, device: MTLDevice?) {
        super.init(frame: frameRect, device: device)
        
        // bgra8Unorm is most common
        // compute command encoder - computational tasks, no gfx
        // blit - memory management tasks
        // parallel - multiple things at the same time
        // render - render gfx
        // cmd buffer 1 computes texture information to be drawn (compute encoder)
        // cmd buffer 2 uses texture to render (render encoder)
//        self.device = MTLCreateSystemDefaultDevice()
        self.clearColor = MTLClearColor(red: 0.50, green: 0.48, blue: 0.80, alpha: 1)
        self.colorPixelFormat = .bgra8Unorm
        self.metalCommandQueue = device?.makeCommandQueue()
        
        createRenderPipelineState()
        createBuffers()
    }
    
    required init(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    private func createRenderPipelineState() {
        let library = device?.makeDefaultLibrary()
        let vertexFunction = library?.makeFunction(name: "basic_vertex_shader")
        let fragmentFunction = library?.makeFunction(name: "basic_fragement_shader")
        
        let renderPipelineDescriptor = MTLRenderPipelineDescriptor()
        renderPipelineDescriptor.colorAttachments[0].pixelFormat = .bgra8Unorm
        renderPipelineDescriptor.vertexFunction = vertexFunction
        renderPipelineDescriptor.fragmentFunction = fragmentFunction
        self.renderPipelineState = try! device?.makeRenderPipelineState(descriptor: renderPipelineDescriptor)
    }
    
    private func createBuffers() {
        // MTLBuffer - unformatted device accessible space
        // Buffer will always have the same size
        // we want to read and write shiz
        // (0,0,0) in the middle of the screen
        vertexBuffer = device?.makeBuffer(bytes: vertices, length: MemoryLayout<SIMD3<Float>>.stride * vertices.count, options: [])
    }
    
    override func draw(_ dirtyRect: NSRect) {
        guard let drawable = self.currentDrawable,
                let renderPassDescriptor = currentRenderPassDescriptor else { return }
        
        let commandBuffer = metalCommandQueue.makeCommandBuffer()
        let renderCommandEncoder = commandBuffer?.makeRenderCommandEncoder(descriptor: renderPassDescriptor)
        renderCommandEncoder?.setRenderPipelineState(renderPipelineState)
        
        // set buffer in device space
        renderCommandEncoder?.setVertexBuffer(vertexBuffer, offset: 0, index: 0)
        // start with the top vertice and move counter clockwise
        renderCommandEncoder?.drawPrimitives(type: .triangle, vertexStart: 0, vertexCount: vertices.count)
        
        renderCommandEncoder?.endEncoding()
        commandBuffer?.present(drawable)
        commandBuffer?.commit()
    }
}
