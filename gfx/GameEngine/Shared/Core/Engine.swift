import MetalKit

class Engine {
    public static var Device: MTLDevice!
    // 1 time per GPU you have
    public static var CommandQueue: MTLCommandQueue!
    
    public static func Ignite(device: MTLDevice) {
        self.Device = device
        self.CommandQueue = device.makeCommandQueue()
        ShaderLibrary.create()
        VertexDescriptorLibrary.create()
        DepthStencilStateLibrary.create()
        RenderPipelineDescriptorLibrary.create()
        RenderPipelineStateLibrary.create()
        MeshLibrary.create()
        
        SceneManager.create(.Sandbox)
    }
}
