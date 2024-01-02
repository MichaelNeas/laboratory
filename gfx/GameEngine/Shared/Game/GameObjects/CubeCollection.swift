import MetalKit

final class CubeCollection: InstancedGameObject {
    var cubesWide = 0
    var cubesHigh = 0
    var cubesBack = 0
    
    init(cubesWide: Int = 0, cubesHigh: Int = 0, cubesBack: Int = 0) {
        super.init(meshType: .CubeCustom, instanceCount: cubesWide * cubesHigh * cubesBack)
        self.cubesWide = cubesWide
        self.cubesHigh = cubesHigh
        self.cubesBack = cubesBack
        self.name = String(describing: type(of: self))
        
        print("Cube count = \(cubesBack * cubesHigh * cubesWide)")
        
        setColor(ColorUtil.randomColor)
    }
    
    override func doUpdate() {
        let halfWide: Float = Float(cubesWide / 2)
        let halfHigh: Float = Float(cubesHigh / 2)
        let halfBack: Float = Float(cubesBack / 2)
        
        var index: Int = 0
        let gap: Float = cos(GameTime.TotalGameTime / 2) * 10
        for y in stride(from: -halfHigh, to: halfHigh, by: 1.0) {
            let posY = Float(y * gap)
            for x in stride(from: -halfWide, to: halfWide, by: 1.0) {
                let posX = Float(x * gap)
                for z in stride(from: -halfBack, to: halfBack, by: 1.0) {
                    let posZ = Float(z * gap)
                    let node = nodes[index]
                    node.position = SIMD3<Float>(posX, posY, posZ)
                    node.rotate(0, -GameTime.DeltaTime * 2, -GameTime.DeltaTime * 2)
                    node.setScale(0.3)
                    index += 1
                }
            }
        }
    }
}
