import MetalKit

// depth check allows pixels to be drawn that are closer in z than other pixels
enum DepthStencilStateTypes {
    case Less
}

class DepthStencilStateLibrary {
    
    private static var depthStencilStates: [DepthStencilStateTypes: DepthStencilState] = [:]
    
    public static func create() {
        createDefaultDepthStencilStates()
    }
    
    private static func createDefaultDepthStencilStates() {
        depthStencilStates.updateValue(Less_DepthStencilState(), forKey: .Less)
    }
    
    public static func DepthStencilState(_ depthStencilStateType: DepthStencilStateTypes)->MTLDepthStencilState{
        return depthStencilStates[depthStencilStateType]!.depthStencilState
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
