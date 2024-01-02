
class Quad: GameObject {
    init() {
        super.init(meshType: .QuadCustom)
        self.name = "Quad"
        
        let cube = Cube()
        cube.setScale(0.3)
        addChild(cube)
    }
}
