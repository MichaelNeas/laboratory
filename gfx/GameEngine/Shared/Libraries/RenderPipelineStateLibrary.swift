import MetalKit

enum RenderPipelineStateTypes {
    case Basic
    case Instanced
}

class RenderPipelineStateLibrary {
    private static var renderPipelineStates = [RenderPipelineStateTypes: RenderPipelineState]()
    
    static func create() {
        createDefaultRenderPipelineStates()
    }
    
    private static func createDefaultRenderPipelineStates() {
        renderPipelineStates.updateValue(BasicRenderPipelineState(), forKey: .Basic)
        renderPipelineStates.updateValue(InstancedRenderPipelineState(), forKey: .Instanced)
    }
    
    static func PipelineState(_ renderPipelineStateType: RenderPipelineStateTypes)->MTLRenderPipelineState {
        renderPipelineStates[renderPipelineStateType]!.renderPipelineState
    }
}

protocol RenderPipelineState {
    var name: String { get }
    var renderPipelineState: MTLRenderPipelineState! { get }
}

struct BasicRenderPipelineState: RenderPipelineState {
    var name: String = "Basic Render Pipeline State"
    
    var renderPipelineState: MTLRenderPipelineState!
    
    init() {
        renderPipelineState = try! Engine.Device.makeRenderPipelineState(descriptor: RenderPipelineDescriptorLibrary.descriptor(.Basic))
    }
}

struct InstancedRenderPipelineState: RenderPipelineState {
    var name: String = "Instanced Render Pipeline State"
    
    var renderPipelineState: MTLRenderPipelineState!
    
    init() {
        renderPipelineState = try! Engine.Device.makeRenderPipelineState(descriptor: RenderPipelineDescriptorLibrary.descriptor(.Instanced))
    }
}
