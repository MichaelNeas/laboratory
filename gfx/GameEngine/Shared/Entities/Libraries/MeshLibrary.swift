import MetalKit

enum MeshTypes {
    case TriangleCustom
    case QuadCustom
    case CubeCustom
}

class MeshLibrary: Library<MeshTypes,Mesh> {
    
    private var library: [MeshTypes:Mesh] = [:]
        
    override func fillLibrary() {
        library.updateValue(TriangleCustomMesh(), forKey: .TriangleCustom)
        library.updateValue(QuadCustomMesh(), forKey: .QuadCustom)
        library.updateValue(CubeCustomMesh(), forKey: .CubeCustom)
    }
    
    override subscript(_ type: MeshTypes)->Mesh {
        library[type]!
    }
}

protocol Mesh {
    var vertexCount: Int { get }
    var instanceCount: Int { get set }
    func drawPrimitives(_ renderCommandEncoder: MTLRenderCommandEncoder)
}

class CustomMesh: Mesh {
    
    var vertices: [Vertex] = []
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
        vertexBuffer = Engine.Device.makeBuffer(bytes: vertices, length: Vertex.stride(vertexCount), options: [])
    }
    
    func addVertex(position: SIMD3<Float>,
                   color: SIMD4<Float> = SIMD4<Float>(1,0,1,1),
                   textureCoordinate: SIMD2<Float> = SIMD2<Float>(repeating: 0)) {
        vertices.append(Vertex(position: position, color: color, textureCoordinate: textureCoordinate))
    }
    
    func drawPrimitives(_ renderCommandEncoder: MTLRenderCommandEncoder) {
        renderCommandEncoder.setVertexBuffer(vertexBuffer, offset: 0, index: 0)
        renderCommandEncoder.drawPrimitives(type: .triangle,
                                            vertexStart: 0,
                                            vertexCount: vertexCount,
                                            instanceCount: instanceCount)
    }
}

class TriangleCustomMesh: CustomMesh {
    override func createVertices() {
        addVertex(position: SIMD3<Float>( 0, 1,0), color: SIMD4<Float>(1,0,0,1))
        addVertex(position: SIMD3<Float>(-1,-1,0), color: SIMD4<Float>(0,1,0,1))
        addVertex(position: SIMD3<Float>( 1,-1,0), color: SIMD4<Float>(0,0,1,1))
    }
}

class QuadCustomMesh: CustomMesh {
    override func createVertices() {
        // Texture coordinates origin is top left at 0,0 - U is X, V is Y
        addVertex(position: SIMD3<Float>( 1, 1,0), color: SIMD4<Float>(1,0,0,1), textureCoordinate: SIMD2<Float>(1, 0)) //Top Right
        addVertex(position: SIMD3<Float>(-1, 1,0), color: SIMD4<Float>(0,1,0,1), textureCoordinate: SIMD2<Float>(0, 0)) //Top Left
        addVertex(position: SIMD3<Float>(-1,-1,0), color: SIMD4<Float>(0,0,1,1), textureCoordinate: SIMD2<Float>(0, 1)) //Bottom Left
        
        addVertex(position: SIMD3<Float>( 1, 1,0), color: SIMD4<Float>(1,0,0,1), textureCoordinate: SIMD2<Float>(1, 0)) //Top Right
        addVertex(position: SIMD3<Float>(-1,-1,0), color: SIMD4<Float>(0,0,1,1), textureCoordinate: SIMD2<Float>(0, 1)) //Bottom Left
        addVertex(position: SIMD3<Float>( 1,-1,0), color: SIMD4<Float>(1,0,1,1), textureCoordinate: SIMD2<Float>(1, 1)) //Bottom Right
    }
}

class CubeCustomMesh: CustomMesh {
    override func createVertices() {
        //Left
        addVertex(position: SIMD3<Float>(-1.0,-1.0,-1.0), color: SIMD4<Float>(1.0, 0.5, 0.0, 1.0))
        addVertex(position: SIMD3<Float>(-1.0,-1.0, 1.0), color: SIMD4<Float>(0.0, 1.0, 0.5, 1.0))
        addVertex(position: SIMD3<Float>(-1.0, 1.0, 1.0), color: SIMD4<Float>(0.0, 0.5, 1.0, 1.0))
        addVertex(position: SIMD3<Float>(-1.0,-1.0,-1.0), color: SIMD4<Float>(1.0, 1.0, 0.0, 1.0))
        addVertex(position: SIMD3<Float>(-1.0, 1.0, 1.0), color: SIMD4<Float>(0.0, 1.0, 1.0, 1.0))
        addVertex(position: SIMD3<Float>(-1.0, 1.0,-1.0), color: SIMD4<Float>(1.0, 0.0, 1.0, 1.0))
        
        //RIGHT
        addVertex(position: SIMD3<Float>( 1.0, 1.0, 1.0), color: SIMD4<Float>(1.0, 0.0, 0.5, 1.0))
        addVertex(position: SIMD3<Float>( 1.0,-1.0,-1.0), color: SIMD4<Float>(0.0, 1.0, 0.0, 1.0))
        addVertex(position: SIMD3<Float>( 1.0, 1.0,-1.0), color: SIMD4<Float>(0.0, 0.5, 1.0, 1.0))
        addVertex(position: SIMD3<Float>( 1.0,-1.0,-1.0), color: SIMD4<Float>(1.0, 1.0, 0.0, 1.0))
        addVertex(position: SIMD3<Float>( 1.0, 1.0, 1.0), color: SIMD4<Float>(0.0, 1.0, 1.0, 1.0))
        addVertex(position: SIMD3<Float>( 1.0,-1.0, 1.0), color: SIMD4<Float>(1.0, 0.5, 1.0, 1.0))
        
        //TOP
        addVertex(position: SIMD3<Float>( 1.0, 1.0, 1.0), color: SIMD4<Float>(1.0, 0.0, 0.0, 1.0))
        addVertex(position: SIMD3<Float>( 1.0, 1.0,-1.0), color: SIMD4<Float>(0.0, 1.0, 0.0, 1.0))
        addVertex(position: SIMD3<Float>(-1.0, 1.0,-1.0), color: SIMD4<Float>(0.0, 0.0, 1.0, 1.0))
        addVertex(position: SIMD3<Float>( 1.0, 1.0, 1.0), color: SIMD4<Float>(1.0, 1.0, 0.0, 1.0))
        addVertex(position: SIMD3<Float>(-1.0, 1.0,-1.0), color: SIMD4<Float>(0.5, 1.0, 1.0, 1.0))
        addVertex(position: SIMD3<Float>(-1.0, 1.0, 1.0), color: SIMD4<Float>(1.0, 0.0, 1.0, 1.0))
        
        //BOTTOM
        addVertex(position: SIMD3<Float>( 1.0,-1.0, 1.0), color: SIMD4<Float>(1.0, 0.5, 0.0, 1.0))
        addVertex(position: SIMD3<Float>(-1.0,-1.0,-1.0), color: SIMD4<Float>(0.5, 1.0, 0.0, 1.0))
        addVertex(position: SIMD3<Float>( 1.0,-1.0,-1.0), color: SIMD4<Float>(0.0, 0.0, 1.0, 1.0))
        addVertex(position: SIMD3<Float>( 1.0,-1.0, 1.0), color: SIMD4<Float>(1.0, 1.0, 0.5, 1.0))
        addVertex(position: SIMD3<Float>(-1.0,-1.0, 1.0), color: SIMD4<Float>(0.0, 1.0, 1.0, 1.0))
        addVertex(position: SIMD3<Float>(-1.0,-1.0,-1.0), color: SIMD4<Float>(1.0, 0.5, 1.0, 1.0))
        
        //BACK
        addVertex(position: SIMD3<Float>( 1.0, 1.0,-1.0), color: SIMD4<Float>(1.0, 0.5, 0.0, 1.0))
        addVertex(position: SIMD3<Float>(-1.0,-1.0,-1.0), color: SIMD4<Float>(0.5, 1.0, 0.0, 1.0))
        addVertex(position: SIMD3<Float>(-1.0, 1.0,-1.0), color: SIMD4<Float>(0.0, 0.0, 1.0, 1.0))
        addVertex(position: SIMD3<Float>( 1.0, 1.0,-1.0), color: SIMD4<Float>(1.0, 1.0, 0.0, 1.0))
        addVertex(position: SIMD3<Float>( 1.0,-1.0,-1.0), color: SIMD4<Float>(0.0, 1.0, 1.0, 1.0))
        addVertex(position: SIMD3<Float>(-1.0,-1.0,-1.0), color: SIMD4<Float>(1.0, 0.5, 1.0, 1.0))
        
        //FRONT
        addVertex(position: SIMD3<Float>(-1.0, 1.0, 1.0), color: SIMD4<Float>(1.0, 0.5, 0.0, 1.0))
        addVertex(position: SIMD3<Float>(-1.0,-1.0, 1.0), color: SIMD4<Float>(0.0, 1.0, 0.0, 1.0))
        addVertex(position: SIMD3<Float>( 1.0,-1.0, 1.0), color: SIMD4<Float>(0.5, 0.0, 1.0, 1.0))
        addVertex(position: SIMD3<Float>( 1.0, 1.0, 1.0), color: SIMD4<Float>(1.0, 1.0, 0.5, 1.0))
        addVertex(position: SIMD3<Float>(-1.0, 1.0, 1.0), color: SIMD4<Float>(0.0, 1.0, 1.0, 1.0))
        addVertex(position: SIMD3<Float>( 1.0,-1.0, 1.0), color: SIMD4<Float>(1.0, 0.0, 1.0, 1.0))
    }

}
