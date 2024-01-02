import MetalKit

enum RenderPipelineStateTypes {
    case Basic
    case Instanced
}

class RenderPipelineStateLibrary: Library<RenderPipelineStateTypes, MTLRenderPipelineState> {
    
    private var library: [RenderPipelineStateTypes: RenderPipelineState] = [:]
    
    override func fillLibrary() {
        library.updateValue(RenderPipelineState(renderPipelineDescriptorType: .Basic), forKey: .Basic)
        library.updateValue(RenderPipelineState(renderPipelineDescriptorType: .Instanced), forKey: .Instanced)
    }
    
    override subscript(_ type: RenderPipelineStateTypes)->MTLRenderPipelineState {
        library[type]!.renderPipelineState
    }
    
}

class RenderPipelineState {
    
    var renderPipelineState: MTLRenderPipelineState!
    init(renderPipelineDescriptorType: RenderPipelineDescriptorTypes) {
        do{
            renderPipelineState = try Engine.Device.makeRenderPipelineState(descriptor: Graphics.RenderPipelineDescriptors[renderPipelineDescriptorType])
        } catch let error as NSError {
            print("ERROR::CREATE::RENDER_PIPELINE_STATE::__::\(error)")
        }
    }
    
}
