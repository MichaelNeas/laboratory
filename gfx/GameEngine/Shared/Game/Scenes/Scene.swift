import MetalKit

class GameScene: Node {
    
    private var cameraManager = CameraManager()
    private var sceneConstants = SceneConstants()
    private var lightManager = LightManager()
    
    init() {
        super.init(name: "Scene")
        build()
    }
    
    func build() {}
    
    func addCamera(_ camera: Camera, isCurrentCamera: Bool = true) {
        cameraManager.registerCamera(camera: camera)
        if isCurrentCamera {
            cameraManager.setCamera(cameraType: camera.cameraType)
        }
    }
    
    func addLight(_ lightObject: LightObject) {
        addChild(lightObject)
        lightManager.add(lightObject: lightObject)
    }
 
    func updateSceneConstants() {
        sceneConstants.viewMatrix = cameraManager.currentCamera.viewMatrix
        sceneConstants.projectionMatrix = cameraManager.currentCamera.projectionMatrix
        sceneConstants.totalGameTime = GameTime.TotalGameTime
    }
    
    func updateCameras() {
        cameraManager.update()
    }
    
    override func update() {
        updateSceneConstants()
        super.update()
    }
    
    override func render(renderCommandEncoder: MTLRenderCommandEncoder) {
        renderCommandEncoder.setVertexBytes(&sceneConstants, length: SceneConstants.stride, index: 1)
        lightManager.setLightData(renderCommandEncoder)
        super.render(renderCommandEncoder: renderCommandEncoder)
    }
}
