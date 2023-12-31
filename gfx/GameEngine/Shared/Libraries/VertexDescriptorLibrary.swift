import MetalKit

enum VertexDescriptorTypes {
    case Basic
}

enum VertexDescriptorLibrary {
    private static var vertexDescriptors = [VertexDescriptorTypes: VertexDescriptor]()
    
    static func create() {
        createDefaultVertexDescriptors()
    }
    
    private static func createDefaultVertexDescriptors() {
        vertexDescriptors.updateValue(BasicVertexDescriptor(), forKey: .Basic)
    }
    
    static func descriptor(_ vertexDescriptorType: VertexDescriptorTypes)->MTLVertexDescriptor {
        vertexDescriptors[vertexDescriptorType]!.vertexDescriptor
    }
}

protocol VertexDescriptor {
    var name: String { get }
    var vertexDescriptor: MTLVertexDescriptor! { get }
}

struct BasicVertexDescriptor: VertexDescriptor {
    var name: String = "Basic Vertex Descriptor"
    
    var vertexDescriptor: MTLVertexDescriptor!
    
    init() {
        vertexDescriptor = MTLVertexDescriptor()
        // position
        vertexDescriptor.attributes[0].format = .float3
        vertexDescriptor.attributes[0].bufferIndex = 0
        vertexDescriptor.attributes[0].offset = 0
        
        // color
        vertexDescriptor.attributes[1].format = .float4
        vertexDescriptor.attributes[1].bufferIndex = 0
        vertexDescriptor.attributes[1].offset = SIMD3<Float>.size
        
        vertexDescriptor.layouts[0].stride = Vertex.stride
    }
}
