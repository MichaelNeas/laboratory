class DebugCamera: Camera {
    var cameraType: CameraTypes = .Debug
    
    var position: SIMD3<Float> = SIMD3<Float>(repeating: 0)
    
    func update(deltaTime: Float) {
        if Keyboard.isKeyPressed(.leftArrow) {
            self.position.x -= deltaTime
        }
        
        if Keyboard.isKeyPressed(.rightArrow) {
            self.position.x += deltaTime
        }
        
        if Keyboard.isKeyPressed(.upArrow) {
            self.position.y += deltaTime
        }
        
        if Keyboard.isKeyPressed(.downArrow) {
            self.position.y -= deltaTime
        }
    }
}
