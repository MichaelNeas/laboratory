import MetalKit


class GameObject: Node {
    var modelConstants = ModelConstants()
    
    var mesh: Mesh
    
    init(meshType: MeshTypes) {
        self.mesh = MeshLibrary.Mesh(meshType)
    }
    
    var time: Float = 0
    func update(deltaTime: Float) {
        time += deltaTime
        // delta position goes up and down
//        self.position.x = sin(time)
//        self.position.y = sin(time)
        self.scale = SIMD3<Float>(repeating: cos(time))
//        self.rotation.z = cos(time)
        
        updateModelConstants()
    }
    
    private func updateModelConstants() {
        modelConstants.modelMatrix = self.modelMatrix
    }
}

extension GameObject: Renderable {
    func doRender(_ renderCommandEncoder: MTLRenderCommandEncoder) {
        // use bytes when <4k data
        renderCommandEncoder.setVertexBytes(&modelConstants, length: ModelConstants.stride, index: 1)
        // lines allows you to see the outlines vs filled up
//        renderCommandEncoder.setTriangleFillMode(.lines)
        // each game object will have it's own render pipeline state
        renderCommandEncoder.setRenderPipelineState(RenderPipelineStateLibrary.PipelineState(.Basic))
        // set buffer in device space
        renderCommandEncoder.setVertexBuffer(mesh.vertexBuffer, offset: 0, index: 0)
        // start with the top vertice and move counter clockwise
        renderCommandEncoder.drawPrimitives(type: .triangle, vertexStart: 0, vertexCount: mesh.vertexCount)
    }
}

// model constants are a way of transfering movement information on our object to GPU
