import MetalKit

enum SamplerStateTypes {
    case none
    case linear
}

protocol SamplerState {
    var name: String { get }
    var samplerState: MTLSamplerState { get }
}

final class SamplerStateLibrary: Library<SamplerStateTypes, MTLSamplerState> {
    
    private var library: [SamplerStateTypes: SamplerState] = [:]
    
    override func fillLibrary() {
        library.updateValue(LinearSamplerState(), forKey: .linear)
    }
    
    override subscript(type: SamplerStateTypes) -> MTLSamplerState {
        (library[type]?.samplerState)!
    }
}

final class LinearSamplerState: SamplerState {
    var name: String = "Linear Sampler State"
    var samplerState: MTLSamplerState
    
    init() {
        let descriptor = MTLSamplerDescriptor()
        descriptor.minFilter = .linear
        descriptor.magFilter = .linear
        descriptor.label = "Linear Sampler Descriptor"
        samplerState = Engine.Device.makeSamplerState(descriptor: descriptor)!
    }
}
