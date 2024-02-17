enum Graphics {
    
    private static var vertexShaderLibrary: VertexShaderLibrary!
    public static var VertexShaders: VertexShaderLibrary { vertexShaderLibrary }
    
    private static var fragmentShaderLibrary: FragmenthaderLibrary!
    public static var FragmentShaders: FragmenthaderLibrary { fragmentShaderLibrary }
    
    private static var vertexDescriptorLibrary: VertexDescriptorLibrary!
    public static var VertexDescriptors: VertexDescriptorLibrary { vertexDescriptorLibrary }
    
    private static var renderPipelineDescriptorLibrary: RenderPipelineDescriptorLibrary!
    public static var RenderPipelineDescriptors: RenderPipelineDescriptorLibrary { renderPipelineDescriptorLibrary }
    
    private static var renderPipelineStateLibrary: RenderPipelineStateLibrary!
    public static var RenderPipelineStates: RenderPipelineStateLibrary { renderPipelineStateLibrary }
    
    private static var depthStencilStateLibrary: DepthStencilStateLibrary!
    public static var DepthStencilStates: DepthStencilStateLibrary { depthStencilStateLibrary }
    
    private static var samplerStateLibrary: SamplerStateLibrary!
    public static var SamplerStates: SamplerStateLibrary { samplerStateLibrary }
    
    public static func Initialize() {
        self.vertexShaderLibrary = VertexShaderLibrary()
        self.fragmentShaderLibrary = FragmenthaderLibrary()
        self.vertexDescriptorLibrary = VertexDescriptorLibrary()
        self.renderPipelineDescriptorLibrary = RenderPipelineDescriptorLibrary()
        self.renderPipelineStateLibrary = RenderPipelineStateLibrary()
        self.depthStencilStateLibrary = DepthStencilStateLibrary()
        self.samplerStateLibrary = SamplerStateLibrary()
    }
    
}
