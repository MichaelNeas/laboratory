import MetalKit

class Node {
    
    var position: SIMD3<Float> = SIMD3<Float>(repeating: 0)
    var scale: SIMD3<Float> = SIMD3<Float>(repeating: 1)
    var rotation: SIMD3<Float> = SIMD3<Float>(repeating: 0)
    
    var modelMatrix: matrix_float4x4 {
        var modelMatrix = matrix_identity_float4x4
        // move
        modelMatrix.translate(direction: position)
        
        modelMatrix.rotate(angle: rotation.x, axis: X_AXIS)
        modelMatrix.rotate(angle: rotation.y, axis: Y_AXIS)
        modelMatrix.rotate(angle: rotation.z, axis: Z_AXIS)
        
        modelMatrix.scale(axis: scale)
        return modelMatrix
    }
    
    var children = [Node]()
    
    func addChild(_ child: Node) {
        children.append(child)
    }
    
    func update(deltaTime: Float) {
        children.forEach { $0.update(deltaTime: deltaTime) }
    }
    
    func render(renderCommandEncoder: MTLRenderCommandEncoder) {
        children.forEach { $0.render(renderCommandEncoder: renderCommandEncoder) }
        
        if let renderable = self as? Renderable {
            renderable.doRender(renderCommandEncoder)
        }
    }
}
