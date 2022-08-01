
class Cube: GameObject {
    init() {
        super.init(meshType: .CubeCustom)
    }
    
    override func update(deltaTime: Float) {
        self.rotation.x += Float.randomZeroToOne * deltaTime
        self.rotation.y += Float.randomZeroToOne * deltaTime
        super.update(deltaTime: deltaTime)
    }
}
