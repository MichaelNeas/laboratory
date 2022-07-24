import MetalKit

enum MeshTypes {
    case TriangleCustom
    case QuadCustom
}

class MeshLibrary {
    private static var meshes: [MeshTypes: Mesh] = [:]
    
    static func create() {
        createDefaultMeshes()
    }
    
    private static func createDefaultMeshes() {
        meshes.updateValue(TriangleCustomMesh(), forKey: .TriangleCustom)
        meshes.updateValue(QuadCustomMesh(), forKey: .QuadCustom)
    }
    
    static func Mesh(_ meshType: MeshTypes) -> Mesh {
        meshes[meshType]!
    }
}

protocol Mesh {
    var vertexBuffer: MTLBuffer! { get }
    var vertexCount: Int { get }
}

class CustomMesh: Mesh {
    var vertices: [Vertex]!
    
    var vertexBuffer: MTLBuffer!
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
