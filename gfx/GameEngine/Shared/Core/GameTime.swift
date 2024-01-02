import MetalKit

enum GameTime {
    private static var totalGameTime: Float = 0.0
    private static var deltaTime: Float = 0.0
    public static func UpdateTime(_ deltaTime: Float) {
        self.deltaTime = deltaTime
        self.totalGameTime += deltaTime
    }
}

extension GameTime {
    public static var TotalGameTime: Float {
        totalGameTime
    }
    
    public static var DeltaTime: Float {
        deltaTime
    }
}
