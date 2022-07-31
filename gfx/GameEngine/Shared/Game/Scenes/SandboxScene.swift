
class SandboxScene: GameScene {
    let camera = DebugCamera()
    
    override func build() {
        addCamera(camera)
        
        let count = 20
        for y in -count..<count {
            for x in -count..<count {
                let pointer = Pointer(camera: camera)
                // center of our object is 0
                pointer.position.y = Float(Float(y) + 0.5) / Float(count)
                pointer.position.x = Float(Float(x) + 0.5) / Float(count)
                pointer.scale = SIMD3<Float>(repeating: 0.1)
                addChild(pointer)
            }
        }
    }
    
    override func update(deltaTime: Float) {
//        let child = children[0]
//        
//        if Keyboard.isKeyPressed(.rightArrow) {
//            child.position.x += deltaTime
//        }
//        
//        if Keyboard.isKeyPressed(.leftArrow) {
//            child.position.x -= deltaTime
//        }
//        
//        if Mouse.IsMouseButtonPressed(button: .LEFT) {
//            children[0].position.x -= deltaTime
//        }
        
//        print(Mouse.GetMouseWindowPosition())
//        print(Mouse.GetMouseViewportPosition())
        
//        children.forEach { child in
//            child.rotation.z += 0.02
//        }
        super.update(deltaTime: deltaTime)
    }
}