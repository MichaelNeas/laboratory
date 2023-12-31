import MetalKit

enum RenderPipelineDescriptorTypes {
    case Basic
    case Instanced
}

class RenderPipelineDescriptorLibrary {
    private static var renderPipelineDescriptors = [RenderPipelineDescriptorTypes: RenderPipelineDescriptor]()
    
    static func create() {
        createDefaultRenderPipelineDescriptors()
    }
    
    private static func createDefaultRenderPipelineDescriptors() {
        renderPipelineDescriptors.updateValue(BasicRenderPipelineDescriptor(), forKey: .Basic)
        renderPipelineDescriptors.updateValue(InstancedRenderPipelineDescriptor(), forKey: .Instanced)
    }
    
    static func descriptor(_ renderPipelineDescriptorType: RenderPipelineDescriptorTypes)->MTLRenderPipelineDescriptor {
        renderPipelineDescriptors[renderPipelineDescriptorType]!.renderPipelineDescriptor
    }
}

protocol RenderPipelineDescriptor {
    var name: String { get }
    var renderPipelineDescriptor: MTLRenderPipelineDescriptor! { get }
}

struct BasicRenderPipelineDescriptor: RenderPipelineDescriptor {
    var name: String = "Basic Render Pipeline Descriptor"
    
    var renderPipelineDescriptor: MTLRenderPipelineDescriptor!
    
    init() {
        renderPipelineDescriptor = MTLRenderPipelineDescriptor()
        renderPipelineDescriptor.label = name
        renderPipelineDescriptor.colorAttachments[0].pixelFormat = Preferences.PixelFormat
        renderPipelineDescriptor.depthAttachmentPixelFormat = Preferences.DepthPixelFormat
        renderPipelineDescriptor.vertexFunction = ShaderLibrary.Vertex(.Basic)
        renderPipelineDescriptor.fragmentFunction = ShaderLibrary.Fragment(.Basic)
        renderPipelineDescriptor.vertexDescriptor = VertexDescriptorLibrary.descriptor(.Basic)
    }
}


struct InstancedRenderPipelineDescriptor: RenderPipelineDescriptor {
    var name: String = "Instanced Render Pipeline Descriptor"
    
    var renderPipelineDescriptor: MTLRenderPipelineDescriptor!
    
    init() {
        renderPipelineDescriptor = MTLRenderPipelineDescriptor()
        renderPipelineDescriptor.label = name
        renderPipelineDescriptor.colorAttachments[0].pixelFormat = Preferences.PixelFormat
        renderPipelineDescriptor.depthAttachmentPixelFormat = Preferences.DepthPixelFormat
        renderPipelineDescriptor.vertexFunction = ShaderLibrary.Vertex(.Instanced)
        renderPipelineDescriptor.fragmentFunction = ShaderLibrary.Fragment(.Basic)
        renderPipelineDescriptor.vertexDescriptor = VertexDescriptorLibrary.descriptor(.Basic)
    }
}

