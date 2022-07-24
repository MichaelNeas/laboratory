import MetalKit

class GameObject {
    var vertices: [Vertex]!
    var vertexBuffer: MTLBuffer!
    
    init() {
        createVertices()
        createBuffers()
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
        vertexBuffer = Engine.Device.makeBuffer(bytes: vertices, length: Vertex.stride * vertices.count, options: [])
    }
    
    func render(renderCommandEncoder: MTLRenderCommandEncoder) {
        // each game object will have it's own render pipeline state
        renderCommandEncoder.setRenderPipelineState(RenderPipelineStateLibrary.PipelineState(.Basic))
        // set buffer in device space
        renderCommandEncoder.setVertexBuffer(vertexBuffer, offset: 0, index: 0)
        // start with the top vertice and move counter clockwise
        renderCommandEncoder.drawPrimitives(type: .triangle, vertexStart: 0, vertexCount: vertices.count)
    }
    
}
