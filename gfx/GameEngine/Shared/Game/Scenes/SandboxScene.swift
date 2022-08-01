
class SandboxScene: GameScene {
    let camera = DebugCamera()
    var cube = Cube()
    
    override func build() {
        addCamera(camera)
        
        camera.position.z = 10
        
        addCubes()

    }
    
    func addCubes() {
        for y in -5..<5{
            let posY = Float(y) + 0.5
            for x in -8..<8 {
                let posX = Float(x) + 0.5
                let cube = Cube()
                cube.position.y = posY
                cube.position.x = posX
                cube.scale = SIMD3<Float>(repeating: 0.3)
                cube.setColor(ColorUtil.randomColor)
                addChild(cube)
            }
        }
    }
    
    override func update(deltaTime: Float) {
//        cube.rotation.x += deltaTime
//        cube.rotation.y += deltaTime
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
    
    func addTriangles() {
        //        let count = 20
        //        for y in -count..<count {
        //            for x in -count..<count {
        //                let pointer = Pointer(camera: camera)
        //                // center of our object is 0
        //                pointer.position.y = Float(Float(y) + 0.5) / Float(count)
        //                pointer.position.x = Float(Float(x) + 0.5) / Float(count)
        //                pointer.scale = SIMD3<Float>(repeating: 0.1)
        //                addChild(pointer)
        //            }
        //        }
    }
}
