import Metal

protocol Renderable {
    func doRender(_ renderCommandEncoder: MTLRenderCommandEncoder)
}
