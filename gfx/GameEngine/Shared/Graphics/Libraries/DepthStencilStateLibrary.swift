import MetalKit

// depth check allows pixels to be drawn that are closer in z than other pixels
enum DepthStencilStateTypes {
    case Less
}

class DepthStencilStateLibrary: Library<DepthStencilStateTypes, MTLDepthStencilState> {
    
    private var library: [DepthStencilStateTypes: DepthStencilState] = [:]
        
    override func fillLibrary() {
        library.updateValue(Less_DepthStencilState(), forKey: .Less)
    }
    
    override subscript(_ type: DepthStencilStateTypes)->MTLDepthStencilState{
        library[type]!.depthStencilState
    }
}

protocol DepthStencilState {
    var depthStencilState: MTLDepthStencilState! { get }
}

class Less_DepthStencilState: DepthStencilState {
    
    var depthStencilState: MTLDepthStencilState!
    
    init() {
        let depthStencilDescriptor = MTLDepthStencilDescriptor()
        depthStencilDescriptor.isDepthWriteEnabled = true
        // less is the compare function for whether we write a pixel or not
        depthStencilDescriptor.depthCompareFunction = .less
        depthStencilState = Engine.Device.makeDepthStencilState(descriptor: depthStencilDescriptor)
    }
    
}
