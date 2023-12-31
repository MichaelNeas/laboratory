import MetalKit


class GameObject: Node {
    var modelConstants = ModelConstants()
    private var material = Material()
    
    var mesh: Mesh
    
    init(meshType: MeshTypes) {
        self.mesh = MeshLibrary.Mesh(meshType)
    }
    
    var time: Float = 0
    override func update(deltaTime: Float) {
        time += deltaTime
        // delta position goes up and down
//        self.position.x = sin(time)
//        self.position.y = sin(time)
//        self.scale = SIMD3<Float>(repeating: cos(time))
//        self.rotation.z = cos(time)
        
        updateModelConstants()
    }
    
    private func updateModelConstants() {
        modelConstants.modelMatrix = self.modelMatrix
    }
}

extension GameObject: Renderable {
    func doRender(_ renderCommandEncoder: MTLRenderCommandEncoder) {
        // lines allows you to see the outlines vs filled up
//        renderCommandEncoder.setTriangleFillMode(.lines)
        // each game object will have it's own render pipeline state
        renderCommandEncoder.setRenderPipelineState(RenderPipelineStateLibrary.PipelineState(.Basic))
        // every time we render check the depth
        renderCommandEncoder.setDepthStencilState(DepthStencilStateLibrary.DepthStencilState(.Less))
        
        // Vertex Shader
        // set buffer in device space
        renderCommandEncoder.setVertexBuffer(mesh.vertexBuffer, offset: 0, index: 0)
        // use bytes when <4k data
        renderCommandEncoder.setVertexBytes(&modelConstants, length: ModelConstants.stride, index: 2)
        
        // Fragment Shader
        renderCommandEncoder.setFragmentBytes(&material, length: Material.stride, index: 1)
        
        // start with the top vertice and move counter clockwise
        mesh.drawPrimitives(renderCommandEncoder)
    }
}

// model constants are a way of transfering movement information on our object to GPU

// MARK: Material
extension GameObject {
    func setColor(_ color: SIMD4<Float>) {
        self.material.color = color
        self.material.useMaterialColor = true
    }
}
