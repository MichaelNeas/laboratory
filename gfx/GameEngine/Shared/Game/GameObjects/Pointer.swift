import MetalKit

class Pointer: GameObject {
    private var camera: Camera
    
    init(camera: Camera) {
        self.camera = camera
        super.init(meshType: .TriangleCustom)
    }
    
    override func doUpdate() {
        rotation.z = (-atan2f(Mouse.GetMouseViewportPosition().x - position.x + camera.position.x,
                              Mouse.GetMouseViewportPosition().y - position.y + camera.position.y))
        
    }
}
