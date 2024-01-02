import Metal

enum SceneTypes {
    case Sandbox
}

class SceneManager {
    private static var currentScene: GameScene!
    
    public static func Initialize(_ sceneType: SceneTypes) {
        setScene(sceneType)
    }
    
    public static func setScene(_ sceneType: SceneTypes) {
        switch sceneType {
        case .Sandbox:
            currentScene = SandboxScene()
        }
    }
    
    public static func tickScene(renderCommandEncoder: MTLRenderCommandEncoder, deltaTime: Float) {
        GameTime.UpdateTime(deltaTime)
        currentScene.updateCameras()
        currentScene.update()
        currentScene.render(renderCommandEncoder: renderCommandEncoder)
    }
}
