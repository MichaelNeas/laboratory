import MetalKit

class Node {
    var name: String
    var id: String
    
    var position: SIMD3<Float> = SIMD3<Float>(repeating: 0)
    var scale: SIMD3<Float> = SIMD3<Float>(repeating: 1)
    var rotation: SIMD3<Float> = SIMD3<Float>(repeating: 0)
    
    var parentModelMatrix = matrix_identity_float4x4
    
    var modelMatrix: matrix_float4x4 {
        var modelMatrix = matrix_identity_float4x4
        // move
        modelMatrix.translate(direction: position)
        
        modelMatrix.rotate(angle: rotation.x, axis: X_AXIS)
        modelMatrix.rotate(angle: rotation.y, axis: Y_AXIS)
        modelMatrix.rotate(angle: rotation.z, axis: Z_AXIS)
        
        modelMatrix.scale(axis: scale)
        return matrix_multiply(parentModelMatrix, modelMatrix)
    }
    
    var children = [Node]()
    
    init(name: String = "Node") {
        self.name = name
        self.id = UUID().uuidString
    }
    
    func addChild(_ child: Node) {
        children.append(child)
    }
    
    func doUpdate() {}
    
    func update() {
        doUpdate()
        for child in children {
            child.parentModelMatrix = modelMatrix
            child.update()
        }
    }
    
    func render(renderCommandEncoder: MTLRenderCommandEncoder) {
        renderCommandEncoder.pushDebugGroup("Rendering \(name)")
        if let renderable = self as? Renderable {
            renderable.doRender(renderCommandEncoder)
        }
        // render children after me
        children.forEach { $0.render(renderCommandEncoder: renderCommandEncoder) }
        renderCommandEncoder.popDebugGroup()
    }
}

extension Node {

    func move(_ x: Float, _ y: Float, _ z: Float){ self.position += SIMD3<Float>(x,y,z) }
    func moveX(_ delta: Float){ self.position.x += delta }
    func moveY(_ delta: Float){ self.position.y += delta }
    func moveZ(_ delta: Float){ self.position.z += delta }
    
    func rotate(_ x: Float, _ y: Float, _ z: Float){ self.rotation += SIMD3<Float>(x,y,z) }
    func rotateX(_ delta: Float){ self.rotation.x += delta }
    func rotateY(_ delta: Float){ self.rotation.y += delta }
    func rotateZ(_ delta: Float){ self.rotation.z += delta }
    
    func setScale(_ scale: Float){self.scale = SIMD3<Float>(scale, scale, scale)}
}
