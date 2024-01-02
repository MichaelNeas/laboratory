import MetalKit

enum VertexShaderTypes{
    case Basic
    case Instanced
}

class VertexShaderLibrary: Library<VertexShaderTypes, MTLFunction> {
    
    private var library: [VertexShaderTypes: Shader] = [:]
    
    override func fillLibrary() {
        library.updateValue(Shader(name: "Basic Vertex Shader",
                                         functionName: "basicVertexShader"),
                                  forKey: .Basic)
        
        library.updateValue(Shader(name: "Instanced Vertex Shader",
                                         functionName: "instancedVertexShader"),
                                  forKey: .Instanced)
    }
    
    override subscript(_ type: VertexShaderTypes)->MTLFunction {
        return (library[type]?.function)!
    }
}
