
class SandboxScene: GameScene {
    override func build() {
        for y in -5..<5 {
            for x in -5..<5 {
                let player = Player()
                player.position.y = Float(Float(y) + 0.5) / 5
                player.position.x = Float(Float(x) + 0.5) / 5
                player.scale = SIMD3<Float>(repeating: 0.1)
                addChild(player)
            }
        }
    }
    
    override func update(deltaTime: Float) {
        children.forEach { child in
            child.rotation.z += 0.02
        }
        super.update(deltaTime: deltaTime)
    }
}
