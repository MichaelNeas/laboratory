import MetalKit

class Pointer: GameObject {
    private var camera: Camera
    
    init(camera: Camera) {
        self.camera = camera
        super.init(meshType: .TriangleCustom)
    }
    
    override func update(deltaTime: Float) {
        
        self.rotation.z = -atan2(
            Mouse.GetMouseViewportPosition().x - position.x + camera.position.x, 
            Mouse.GetMouseViewportPosition().y - position.y + camera.position.y)
        super.update(deltaTime: deltaTime)
    }
}
