import simd

final class DebugCamera: Camera {
    
    override var projectionMatrix: matrix_float4x4 {
        matrix_float4x4.perspective(degreesFov: 45,
                                    aspectRatio: Renderer.AspectRatio,
                                    near: 0.1,
                                    far: 1000)
    }
    
    init() {
        super.init(cameraType: .Debug)
    }

    override func doUpdate() {
        if Keyboard.isKeyPressed(.leftArrow) {
            moveX(-GameTime.DeltaTime)
        }
        
        if Keyboard.isKeyPressed(.rightArrow) {
            moveX(GameTime.DeltaTime)
        }
        
        if Keyboard.isKeyPressed(.upArrow) {
            moveY(GameTime.DeltaTime)
        }
        
        if Keyboard.isKeyPressed(.downArrow) {
            moveY(-GameTime.DeltaTime)
        }
    }
}
