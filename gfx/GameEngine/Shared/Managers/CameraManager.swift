class CameraManager {
    private var cameras: [CameraTypes: Camera] = [:]
    var currentCamera: Camera!
    
    func registerCamera(camera: Camera) {
        cameras.updateValue(camera, forKey: camera.cameraType)
    }
    
    func setCamera(cameraType: CameraTypes) {
        currentCamera = cameras[cameraType]
    }
    
    func update() {
        for camera in cameras.values {
            camera.update()
        }
    }
}
