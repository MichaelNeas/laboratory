import MetalKit

enum MeshTypes {
    case TriangleCustom
    case QuadCustom
    case CubeCustom
}

class MeshLibrary {
    private static var meshes: [MeshTypes: Mesh] = [:]
    
    static func create() {
        createDefaultMeshes()
    }
    
    private static func createDefaultMeshes() {
        meshes.updateValue(TriangleCustomMesh(), forKey: .TriangleCustom)
        meshes.updateValue(QuadCustomMesh(), forKey: .QuadCustom)
        meshes.updateValue(Cube_CustomMesh(), forKey: .CubeCustom)
    }
    
    static func Mesh(_ meshType: MeshTypes) -> Mesh {
        meshes[meshType]!
    }
}

protocol Mesh {
    var vertexBuffer: MTLBuffer! { get }
    var vertexCount: Int { get }
    func setInstanceCount(_ count: Int)
    func drawPrimitives(_ renderCommandEncoder: MTLRenderCommandEncoder)
}

class CustomMesh: Mesh {
    
    var vertices: [Vertex]!
    
    var vertexBuffer: MTLBuffer!
    var instanceCount = 1
    var vertexCount: Int {
        vertices.count
    }
    
    init() {
        createVertices()
        createBuffers()
    }
    
    func createVertices() { }
    
    func createBuffers() {
        // MTLBuffer - unformatted device accessible space
        // Buffer will always have the same size
        // we want to read and write shiz
        // (0,0,0) in the middle of the screen
        vertexBuffer = Engine.Device.makeBuffer(bytes: vertices, length: Vertex.stride * vertices.count, options: [])
    }
    
    func setInstanceCount(_ count: Int) {
        instanceCount = count
    }
    
    func drawPrimitives(_ renderCommandEncoder: MTLRenderCommandEncoder) {
        renderCommandEncoder.setVertexBuffer(vertexBuffer, offset: 0, index: 0)
//        renderCommandEncoder.drawPrimitives(type: .triangle, vertexStart: 0, vertexCount: vertexCount)
        renderCommandEncoder.drawPrimitives(type: .triangle,
                                            vertexStart: 0,
                                            vertexCount: vertexCount,
                                            instanceCount: instanceCount)
    }
}

class TriangleCustomMesh: CustomMesh {
    override func createVertices() {
        vertices = [
            Vertex(position: [0, 1, 0], color: [1, 0, 0, 1]), // top
            Vertex(position: [-1, -1, 0], color: [0, 1, 0, 1]), // bottom left
            Vertex(position: [1, -1, 0], color: [0, 0, 1, 1]) // bottom right
        ]
    }
}


class QuadCustomMesh: CustomMesh {
    override func createVertices() {
        vertices = [
            Vertex(position: [1,   1, 0],   color: [1, 0, 0, 1]), // top right
            Vertex(position: [-1,  1, 0],   color: [0, 1, 0, 1]), // top left
            Vertex(position: [-1, -1, 0],   color: [0, 0, 1, 1]), // bottom left
            
            Vertex(position: [1,   1, 0],   color: [1, 0, 0, 1]), // top right
            Vertex(position: [-1, -1, 0],   color: [0, 0, 1, 1]), // bottom left
            Vertex(position: [1,  -1, 0],   color: [1, 0, 1, 1]) // bottom right
        ]
    }
}

class Cube_CustomMesh: CustomMesh {
    override func createVertices() {
        vertices = [
            //Left 2 triangles
            Vertex(position: SIMD3<Float>(-1.0,-1.0,-1.0), color: SIMD4<Float>(1.0, 0.5, 0.0, 1.0)),
            Vertex(position: SIMD3<Float>(-1.0,-1.0, 1.0), color: SIMD4<Float>(0.0, 1.0, 0.5, 1.0)),
            Vertex(position: SIMD3<Float>(-1.0, 1.0, 1.0), color: SIMD4<Float>(0.0, 0.5, 1.0, 1.0)),
            Vertex(position: SIMD3<Float>(-1.0,-1.0,-1.0), color: SIMD4<Float>(1.0, 1.0, 0.0, 1.0)),
            Vertex(position: SIMD3<Float>(-1.0, 1.0, 1.0), color: SIMD4<Float>(0.0, 1.0, 1.0, 1.0)),
            Vertex(position: SIMD3<Float>(-1.0, 1.0,-1.0), color: SIMD4<Float>(1.0, 0.0, 1.0, 1.0)),
            
            //RIGHT
            Vertex(position: SIMD3<Float>( 1.0, 1.0, 1.0), color: SIMD4<Float>(1.0, 0.0, 0.5, 1.0)),
            Vertex(position: SIMD3<Float>( 1.0,-1.0,-1.0), color: SIMD4<Float>(0.0, 1.0, 0.0, 1.0)),
            Vertex(position: SIMD3<Float>( 1.0, 1.0,-1.0), color: SIMD4<Float>(0.0, 0.5, 1.0, 1.0)),
            Vertex(position: SIMD3<Float>( 1.0,-1.0,-1.0), color: SIMD4<Float>(1.0, 1.0, 0.0, 1.0)),
            Vertex(position: SIMD3<Float>( 1.0, 1.0, 1.0), color: SIMD4<Float>(0.0, 1.0, 1.0, 1.0)),
            Vertex(position: SIMD3<Float>( 1.0,-1.0, 1.0), color: SIMD4<Float>(1.0, 0.5, 1.0, 1.0)),
            
            //TOP
            Vertex(position: SIMD3<Float>( 1.0, 1.0, 1.0), color: SIMD4<Float>(1.0, 0.0, 0.0, 1.0)),
            Vertex(position: SIMD3<Float>( 1.0, 1.0,-1.0), color: SIMD4<Float>(0.0, 1.0, 0.0, 1.0)),
            Vertex(position: SIMD3<Float>(-1.0, 1.0,-1.0), color: SIMD4<Float>(0.0, 0.0, 1.0, 1.0)),
            Vertex(position: SIMD3<Float>( 1.0, 1.0, 1.0), color: SIMD4<Float>(1.0, 1.0, 0.0, 1.0)),
            Vertex(position: SIMD3<Float>(-1.0, 1.0,-1.0), color: SIMD4<Float>(0.5, 1.0, 1.0, 1.0)),
            Vertex(position: SIMD3<Float>(-1.0, 1.0, 1.0), color: SIMD4<Float>(1.0, 0.0, 1.0, 1.0)),
            
            //BOTTOM
            Vertex(position: SIMD3<Float>( 1.0,-1.0, 1.0), color: SIMD4<Float>(1.0, 0.5, 0.0, 1.0)),
            Vertex(position: SIMD3<Float>(-1.0,-1.0,-1.0), color: SIMD4<Float>(0.5, 1.0, 0.0, 1.0)),
            Vertex(position: SIMD3<Float>( 1.0,-1.0,-1.0), color: SIMD4<Float>(0.0, 0.0, 1.0, 1.0)),
            Vertex(position: SIMD3<Float>( 1.0,-1.0, 1.0), color: SIMD4<Float>(1.0, 1.0, 0.5, 1.0)),
            Vertex(position: SIMD3<Float>(-1.0,-1.0, 1.0), color: SIMD4<Float>(0.0, 1.0, 1.0, 1.0)),
            Vertex(position: SIMD3<Float>(-1.0,-1.0,-1.0), color: SIMD4<Float>(1.0, 0.5, 1.0, 1.0)),
            
            //BACK
            Vertex(position: SIMD3<Float>( 1.0, 1.0,-1.0), color: SIMD4<Float>(1.0, 0.5, 0.0, 1.0)),
            Vertex(position: SIMD3<Float>(-1.0,-1.0,-1.0), color: SIMD4<Float>(0.5, 1.0, 0.0, 1.0)),
            Vertex(position: SIMD3<Float>(-1.0, 1.0,-1.0), color: SIMD4<Float>(0.0, 0.0, 1.0, 1.0)),
            Vertex(position: SIMD3<Float>( 1.0, 1.0,-1.0), color: SIMD4<Float>(1.0, 1.0, 0.0, 1.0)),
            Vertex(position: SIMD3<Float>( 1.0,-1.0,-1.0), color: SIMD4<Float>(0.0, 1.0, 1.0, 1.0)),
            Vertex(position: SIMD3<Float>(-1.0,-1.0,-1.0), color: SIMD4<Float>(1.0, 0.5, 1.0, 1.0)),
            
            //FRONT
            Vertex(position: SIMD3<Float>(-1.0, 1.0, 1.0), color: SIMD4<Float>(1.0, 0.5, 0.0, 1.0)),
            Vertex(position: SIMD3<Float>(-1.0,-1.0, 1.0), color: SIMD4<Float>(0.0, 1.0, 0.0, 1.0)),
            Vertex(position: SIMD3<Float>( 1.0,-1.0, 1.0), color: SIMD4<Float>(0.5, 0.0, 1.0, 1.0)),
            Vertex(position: SIMD3<Float>( 1.0, 1.0, 1.0), color: SIMD4<Float>(1.0, 1.0, 0.5, 1.0)),
            Vertex(position: SIMD3<Float>(-1.0, 1.0, 1.0), color: SIMD4<Float>(0.0, 1.0, 1.0, 1.0)),
            Vertex(position: SIMD3<Float>( 1.0,-1.0, 1.0), color: SIMD4<Float>(1.0, 0.0, 1.0, 1.0))
        ]
    }

}
