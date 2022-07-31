import Metal
enum SceneTypes {
    case Sandbox
}

class SceneManager {
    private static var currentScene: GameScene!
    
    public static func create(_ sceneType: SceneTypes) {
        setScene(sceneType)
    }
    
    public static func setScene(_ sceneType: SceneTypes) {
        switch sceneType {
        case .Sandbox:
            currentScene = SandboxScene()
        }
    }
    
    public static func tickScene(renderCommandEncoder: MTLRenderCommandEncoder, deltaTime: Float) {
        currentScene.update(deltaTime: deltaTime)
        currentScene.render(renderCommandEncoder: renderCommandEncoder)
    }
}
