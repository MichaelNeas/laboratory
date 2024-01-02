import MetalKit

enum VertexDescriptorTypes {
    case Basic
}

class VertexDescriptorLibrary: Library<VertexDescriptorTypes, MTLVertexDescriptor> {
    
    private var library: [VertexDescriptorTypes: VertexDescriptor] = [:]
    
    override func fillLibrary() {
        library.updateValue(BasicVertexDescriptor(), forKey: .Basic)
    }
    
    override subscript(_ type: VertexDescriptorTypes)->MTLVertexDescriptor {
        library[type]!.vertexDescriptor
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
