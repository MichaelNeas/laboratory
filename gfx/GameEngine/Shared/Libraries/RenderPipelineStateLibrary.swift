import MetalKit

enum RenderPipelineStateTypes {
    case Basic
}

class RenderPipelineStateLibrary {
    private static var renderPipelineStates = [RenderPipelineStateTypes: RenderPipelineState]()
    
    static func create() {
        createDefaultRenderPipelineStates()
    }
    
    private static func createDefaultRenderPipelineStates() {
        renderPipelineStates.updateValue(BasicRenderPipelineState(), forKey: .Basic)
    }
    
    static func PipelineState(_ renderPipelineStateType: RenderPipelineStateTypes)->MTLRenderPipelineState {
        renderPipelineStates[renderPipelineStateType]!.renderPipelineState
    }
}

protocol RenderPipelineState {
    var name: String { get }
    var renderPipelineState: MTLRenderPipelineState { get }
}

struct BasicRenderPipelineState: RenderPipelineState {
    var name: String = "Basic Render Pipeline State"
    
    var renderPipelineState: MTLRenderPipelineState {
        try! Engine.Device.makeRenderPipelineState(descriptor: RenderPipelineDescriptorLibrary.descriptor(.Basic))
    }
}
