import MetalKit

class InstancedGameObject: Node {
    private var mesh: Mesh!
    var material = Material()
    
    var nodes: [Node] = []
    private var modelConstants: [ModelConstants] = []
    
    private var modelConstantBuffer: MTLBuffer!
    
    init(meshType: MeshTypes, instanceCount: Int) {
        super.init()
        mesh = MeshLibrary.Mesh(meshType)
        mesh.setInstanceCount(instanceCount)
        generateInstance(instanceCount)
        createBuffers(instanceCount)
    }
    
    func generateInstance(_ instanceCount: Int) {
        for _ in 0..<instanceCount {
            nodes.append(Node())
            modelConstants.append(ModelConstants())
        }
    }
    
    func createBuffers(_ instanceCount: Int) {
        modelConstantBuffer = Engine.Device.makeBuffer(length: ModelConstants.stride(instanceCount), options: [])
    }
    
    private func updateModelConstantBuffer() {
        // grab contents of buffer and bind to pointer
        var pointer = modelConstantBuffer.contents().bindMemory(to: ModelConstants.self, capacity: modelConstants.count)
        
        for node in nodes {
            // update buffer, relative to both the node and model matrix
            pointer.pointee.modelMatrix = matrix_multiply(modelMatrix, node.modelMatrix)
            pointer = pointer.advanced(by: 1)
        }
    }
    
    override func update(deltaTime: Float) {
        updateModelConstantBuffer()
        super.update(deltaTime: deltaTime)
    }
}

extension InstancedGameObject: Renderable {
    func doRender(_ renderCommandEncoder: MTLRenderCommandEncoder) {
        renderCommandEncoder.setRenderPipelineState(RenderPipelineStateLibrary.PipelineState(.Instanced))
        renderCommandEncoder.setDepthStencilState(DepthStencilStateLibrary.DepthStencilState(.Less))
        
        // Vertex Shader
        renderCommandEncoder.setVertexBuffer(modelConstantBuffer, offset: 0, index: 2)
        
        // Fragment Shader
        renderCommandEncoder.setFragmentBytes(&material, length: Material.stride, index: 1)
        
        mesh.drawPrimitives(renderCommandEncoder)
    }
}

// Material Props

extension InstancedGameObject {
    public func setColor(_ color: SIMD4<Float>) {
        self.material.color = color
        self.material.useMaterialColor = true
    }
}
