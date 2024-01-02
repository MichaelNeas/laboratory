
class Cube: GameObject {
    init() {
        super.init(meshType: .CubeCustom)
        self.name = "Cube"
    }
    
    override func doUpdate() {
        rotation.x = GameTime.DeltaTime
        rotation.y = GameTime.DeltaTime
    }
}
