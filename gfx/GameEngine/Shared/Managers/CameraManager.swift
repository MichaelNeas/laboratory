class CameraManager {
    private var cameras: [CameraTypes: Camera] = [:]
    var currentCamera: Camera!
    
    func registerCamera(camera: Camera) {
        cameras.updateValue(camera, forKey: camera.cameraType)
    }
    
    func setCamera(cameraType: CameraTypes) {
        currentCamera = cameras[cameraType]
    }
    
    func update(deltaTime: Float) {
        cameras.values.forEach { $0.update(deltaTime: deltaTime) }
    }
}
