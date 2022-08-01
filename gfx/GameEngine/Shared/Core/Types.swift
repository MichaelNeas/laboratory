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
    var position: SIMD3<Float>
    var color: SIMD4<Float>
}

struct ModelConstants: Sizable {
    var modelMatrix = matrix_identity_float4x4
}

struct SceneConstants: Sizable {
    var viewMatrix = matrix_identity_float4x4
    var projectionMatrix = matrix_identity_float4x4
}

struct Material: Sizable {
    var color = SIMD4<Float>(0.7, 0.7, 0.7, 1.0)
    var useMaterialColor: Bool = false
}

extension SIMD3: Sizable {}
extension SIMD4: Sizable {}
extension Float: Sizable {}
