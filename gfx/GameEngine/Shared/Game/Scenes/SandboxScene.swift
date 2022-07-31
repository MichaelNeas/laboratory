
class SandboxScene: GameScene {
    override func build() {
        let count = 20
        for y in -count..<count {
            for x in -count..<count {
                let player = Player()
                // center of our object is 0
                player.position.y = Float(Float(y) + 0.5) / Float(count)
                player.position.x = Float(Float(x) + 0.5) / Float(count)
                player.scale = SIMD3<Float>(repeating: 0.1)
                addChild(player)
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
