import MetalKit

enum FragmentShaderTypes {
    case Basic
}

class FragmenthaderLibrary: Library<FragmentShaderTypes, MTLFunction> {
    
    private var library: [FragmentShaderTypes: Shader] = [:]
    
    override func fillLibrary() {
        library.updateValue(Shader(name: "Basic Fragment Shader",
                                    functionName: "basicFragmentShader"),
                             forKey: .Basic)
    }
    
    override subscript(_ type: FragmentShaderTypes)->MTLFunction {
        (library[type]?.function)!
    }
    
}
