import MetalKit

class SandboxScene: GameScene {
    var debugCamera = DebugCamera()
//    var quad = Quad()
    var cruiser = Cruiser()
    var leftSun = Sun()
    var middleSun = Sun()
    var rightSun = Sun()
    
    override func build() {
        debugCamera.position = SIMD3<Float>(0,0,6)
        addCamera(debugCamera)
        
        leftSun.position = SIMD3<Float>(-2, 2, 0)
        leftSun.setMaterialIsLit(false)
        leftSun.setMaterialColor(SIMD4<Float>(1,0,0,1))
        leftSun.setLightColor(SIMD3<Float>(1,0,0))
        addLight(leftSun)
        
        middleSun.position = SIMD3<Float>(0, 2, 0)
        middleSun.setMaterialIsLit(false)
        middleSun.setMaterialColor(SIMD4<Float>(1,1,1,1))
        middleSun.setLightColor(SIMD3<Float>(1,1,1))
        addLight(middleSun)
        
        rightSun.position = SIMD3<Float>(2, 2, 0)
        rightSun.setMaterialIsLit(false)
        rightSun.setMaterialColor(SIMD4<Float>(0,0,1,1))
        rightSun.setLightColor(SIMD3<Float>(0,0,1))
        addLight(rightSun)
        
        cruiser.rotation.x = 0.3
        addChild(cruiser)
    }
    
    override func doUpdate() {
        if Mouse.IsMouseButtonPressed(button: .LEFT) {
            cruiser.rotateX(Mouse.GetDY() * GameTime.DeltaTime)
            cruiser.rotateY(Mouse.GetDX() * GameTime.DeltaTime)
        }
    }
}

// old sandbox
//class SandboxScene: GameScene {
//    let camera = DebugCamera()
//    var cube = Cube()
//    
//    var cubeCollection: CubeCollection!
//    
//    override func build() {
//        addCamera(camera)
//        
//        camera.position.z = 100
//        
//        addCubes()
//    }
//    
//    func addCubes() {
//        cubeCollection = CubeCollection(cubesWide: 20, cubesHigh: 20, cubesBack: 20)
//        cubeCollection.position.x = -16
//        addChild(cubeCollection)
//
//        // this old way was creating a child every time, but now with instanced game object we only can reuse meshes
////        for y in -20..<20{
////            let posY = Float(y) + 0.5
////            for x in -20..<20 {
////                let posX = Float(x) + 0.5
////                for z in -20..<20 {
////                    let posZ = Float(z) + 0.5
////                    let cube = Cube()
////                    cube.position.z = posZ
////                    cube.position.y = posY
////                    cube.position.x = posX
////                    cube.scale = SIMD3<Float>(repeating: 0.3)
////                    addChild(cube)
////                }
////            }
////        }
//    }
//    
//    override func update(deltaTime: Float) {
////        cube.rotation.x += deltaTime
////        cube.rotation.y += deltaTime
////        let child = children[0]
////        
////        if Keyboard.isKeyPressed(.rightArrow) {
////            child.position.x += deltaTime
////        }
////        
////        if Keyboard.isKeyPressed(.leftArrow) {
////            child.position.x -= deltaTime
////        }
////        
////        if Mouse.IsMouseButtonPressed(button: .LEFT) {
////            children[0].position.x -= deltaTime
////        }
//        
////        print(Mouse.GetMouseWindowPosition())
////        print(Mouse.GetMouseViewportPosition())
//        
////        children.forEach { child in
////            child.rotation.z += 0.02
////        }
//        cubeCollection.rotation.z += deltaTime
//        super.update(deltaTime: deltaTime)
//    }
//    
//    func addTriangles() {
//        //        let count = 20
//        //        for y in -count..<count {
//        //            for x in -count..<count {
//        //                let pointer = Pointer(camera: camera)
//        //                // center of our object is 0
//        //                pointer.position.y = Float(Float(y) + 0.5) / Float(count)
//        //                pointer.position.x = Float(Float(x) + 0.5) / Float(count)
//        //                pointer.scale = SIMD3<Float>(repeating: 0.1)
//        //                addChild(pointer)
//        //            }
//        //        }
//    }
//}
