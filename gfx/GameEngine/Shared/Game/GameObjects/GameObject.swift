import MetalKit


class GameObject: Node {
    var mesh: Mesh
    
    init(meshType: MeshTypes) {
        self.mesh = MeshLibrary.Mesh(meshType)
    }
}

extension GameObject: Renderable {
    func doRender(_ renderCommandEncoder: MTLRenderCommandEncoder) {
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
