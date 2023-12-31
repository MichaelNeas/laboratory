import MetalKit

enum VertexShaderTypes {
    case Basic
    case Instanced
}

enum FragmentShaderTypes {
    case Basic
}

class ShaderLibrary {
    static var DefaultLibrary: MTLLibrary!
    
    private static var vertexShaders = [VertexShaderTypes: Shader]()
    private static var fragmentShaders = [FragmentShaderTypes: Shader]()
    
    private static func createDefaultShaders() {
        // vertex shaders
        vertexShaders.updateValue(BasicVertexShader(), forKey: .Basic)
        vertexShaders.updateValue(InstancedVertexShader(), forKey: .Instanced)
        
        // fragment shaders
        fragmentShaders.updateValue(BasicFragmentShader(), forKey: .Basic)
    }
    
    static func create() {
        DefaultLibrary = Engine.Device.makeDefaultLibrary()
        createDefaultShaders()
    }
    
    static func Vertex(_ vertexShaderType: VertexShaderTypes) -> MTLFunction {
        vertexShaders[vertexShaderType]!.function
    }
    
    static func Fragment(_ fragmentShaderType: FragmentShaderTypes) -> MTLFunction {
        fragmentShaders[fragmentShaderType]!.function
    }
}

protocol Shader {
    var name: String { get }
    var functionName: String { get }
    var function: MTLFunction! { get }
}

struct BasicVertexShader: Shader {
    var name: String = "Basic Vertex Shader"
    var functionName: String = "vertexShader"
    var function: MTLFunction!
    init() {
        function = ShaderLibrary.DefaultLibrary.makeFunction(name: functionName)!
        function.label = name
    }
}

struct InstancedVertexShader: Shader {
    var name: String = "Instanced Vertex Shader"
    var functionName: String = "instancedVertexShader"
    var function: MTLFunction!
    init() {
        function = ShaderLibrary.DefaultLibrary.makeFunction(name: functionName)!
        function.label = name
    }
}

struct BasicFragmentShader: Shader {
    var name: String = "Basic Fragment Shader"
    var functionName: String = "fragmentShader"
    var function: MTLFunction!
    
    init() {
        function = ShaderLibrary.DefaultLibrary.makeFunction(name: functionName)!
        function.label = name
    }
}
