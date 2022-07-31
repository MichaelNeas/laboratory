import MetalKit

class Player: GameObject {
    init() {
        super.init(meshType: .TriangleCustom)
    }
    
    override func update(deltaTime: Float) {
        
        self.rotation.z = -atan2(Mouse.GetMouseViewportPosition().x - position.x, Mouse.GetMouseViewportPosition().y - position.y)
        super.update(deltaTime: deltaTime)
    }
}
