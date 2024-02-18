import MetalKit

enum MeshTypes {
    case TriangleCustom
    case QuadCustom
    case CubeCustom
    case Cruiser
}

class MeshLibrary: Library<MeshTypes,Mesh> {
    
    private var library: [MeshTypes:Mesh] = [:]
        
    override func fillLibrary() {
        library.updateValue(TriangleCustomMesh(), forKey: .TriangleCustom)
        library.updateValue(QuadCustomMesh(), forKey: .QuadCustom)
        library.updateValue(CubeCustomMesh(), forKey: .CubeCustom)
        library.updateValue(ModelMesh(name: "cruiser"), forKey: .Cruiser)
    }
    
    override subscript(_ type: MeshTypes)->Mesh {
        library[type]!
    }
}

protocol Mesh {
    var instanceCount: Int { get set }
    func drawPrimitives(_ renderCommandEncoder: MTLRenderCommandEncoder)
}

final class ModelMesh: Mesh {
    
    private var meshes = [MTKMesh]()
    
    init(name: String) {
        loadModel(name: name)
    }
    
    func loadModel(name: String) {
        let url = Bundle.main.url(forResource: name, withExtension: "obj")
        
        let descriptor = MTKModelIOVertexDescriptorFromMetal(Graphics.VertexDescriptors[.Basic])
        // tell the description what its attributes are, matching MetalTypes
        (descriptor.attributes[0] as! MDLVertexAttribute).name = MDLVertexAttributePosition
        (descriptor.attributes[1] as! MDLVertexAttribute).name = MDLVertexAttributeColor
        (descriptor.attributes[2] as! MDLVertexAttribute).name = MDLVertexAttributeTextureCoordinate
        
        let bufferAllocator = MTKMeshBufferAllocator(device: Engine.Device)
        let asset = MDLAsset(url: url,
                             vertexDescriptor: descriptor,
                             bufferAllocator: bufferAllocator)
        // metalkit meshes has position, model io has animation stuff
        meshes = try! MTKMesh.newMeshes(asset: asset, device: Engine.Device).metalKitMeshes
    }
    
    // MARK: Mesh
    var instanceCount: Int = 1
    
    func drawPrimitives(_ renderCommandEncoder: MTLRenderCommandEncoder) {
        for mesh in meshes {
            for vertexBuffer in mesh.vertexBuffers {
                renderCommandEncoder.setVertexBuffer(vertexBuffer.buffer, offset: vertexBuffer.offset, index: 0)
                for submesh in mesh.submeshes {
                    // instead of loading 2+ vertices in the same position, use an instance
                    renderCommandEncoder.drawIndexedPrimitives(type: submesh.primitiveType,
                                                               indexCount: submesh.indexCount,
                                                               indexType: submesh.indexType,
                                                               indexBuffer: submesh.indexBuffer.buffer,
                                                               indexBufferOffset: submesh.indexBuffer.offset,
                                                               instanceCount: instanceCount)
                }
            }
        }
    }
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
