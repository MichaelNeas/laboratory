// optimized math library
import simd

protocol Sizable {
    static func size(_ count: Int) -> Int
    static func stride(_ count: Int) -> Int
}

extension Sizable {
    static var size: Int {
        MemoryLayout<Self>.size
    }
    static var stride: Int {
        MemoryLayout<Self>.stride
    }
    static func size(_ count: Int) -> Int {
        MemoryLayout<Self>.size * count
    }
    static func stride(_ count: Int) -> Int {
        MemoryLayout<Self>.stride * count
    }
}

struct Vertex: Sizable {
    // 0,0 is center using cartesian coords
    var position: SIMD3<Float>
    var color: SIMD4<Float>
    // texture and UV coordinates are basically the same thing
    var textureCoordinate: SIMD2<Float>
}

struct ModelConstants: Sizable {
    var modelMatrix = matrix_identity_float4x4
}

struct SceneConstants: Sizable {
    var totalGameTime: Float = 0
    var viewMatrix = matrix_identity_float4x4
    var projectionMatrix = matrix_identity_float4x4
}

struct Material: Sizable {
    var color = SIMD4<Float>(0.7, 0.7, 0.7, 1.0)
    var useMaterialColor: Bool = false
    var useTexture: Bool = false
    var isLit: Bool = true
    var ambient: SIMD3<Float> = SIMD3<Float>(0.3, 0.3, 0.3)
}

struct LightData: Sizable {
    var position: SIMD3<Float> = SIMD3<Float>(0, 0 ,0)
    var color: SIMD3<Float> = SIMD3<Float>(1, 1, 1)
    var brightness: Float = 1.0
    
    var ambientIntensity: Float = 1.0
}

extension SIMD2: Sizable {}
extension SIMD3: Sizable {}
extension SIMD4: Sizable {}
extension Float: Sizable {}
extension Int32: Sizable {}
