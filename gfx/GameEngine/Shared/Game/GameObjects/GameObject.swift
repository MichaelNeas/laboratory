import MetalKit


class GameObject: Node {
    var modelConstants = ModelConstants()
    private var material = Material()
    
    var mesh: Mesh
    
    init(meshType: MeshTypes) {
        mesh = Entities.Meshes[meshType]
    }
    
    override func update() {
        updateModelConstants()
        super.update()
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
        renderCommandEncoder.setRenderPipelineState(Graphics.RenderPipelineStates[.Basic])
        // every time we render check the depth
        renderCommandEncoder.setDepthStencilState(Graphics.DepthStencilStates[.Less])
        
        // Vertex Shader
        // set buffer in device space
//        renderCommandEncoder.setVertexBuffer(mesh.vertexBuffer, offset: 0, index: 0)
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
