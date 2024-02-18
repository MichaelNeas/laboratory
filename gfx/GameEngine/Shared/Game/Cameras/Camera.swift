import simd

enum CameraTypes {
    case Debug
}

class Camera: Node {
    var cameraType: CameraTypes!
    
    var viewMatrix: matrix_float4x4 {
        var viewMatrix = matrix_identity_float4x4
        viewMatrix.rotate(angle: rotation.x, axis: X_AXIS)
        viewMatrix.rotate(angle: rotation.y, axis: Y_AXIS)
        viewMatrix.rotate(angle: rotation.z, axis: Z_AXIS)
        viewMatrix.translate(direction: -position)
        return viewMatrix
    }
    
    var projectionMatrix: matrix_float4x4 {
        return matrix_identity_float4x4
    }
    
    init(cameraType: CameraTypes){
        super.init(name: "Camera")
        self.cameraType = cameraType
    }
}
