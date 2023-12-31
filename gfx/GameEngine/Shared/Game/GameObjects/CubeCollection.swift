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
        
        print("Cube count = \(cubesBack * cubesHigh * cubesWide)")
        
        setColor(ColorUtil.randomColor)
    }
    
    var time: Float = 0
    
    override func update(deltaTime: Float) {
        time += deltaTime
        
        let halfWide = Float(cubesWide / 2)
        let halfHigh = Float(cubesHigh / 2)
        let halfBack = Float(cubesBack / 2)
        
        var index = 0
        // spacing of the cubes together (to change over time)
        // cos is 0 -> 1
        let gap = cos(time / 2) * 10
        for y in stride(from: -halfHigh, to: halfHigh, by: 1.0) {
            let posY = Float(y * gap)
            for x in stride(from: -halfWide, to: halfWide, by: 1.0) {
                let posX = Float(x * gap)
                for z in stride(from: -halfBack, to: halfBack, by: 1.0) {
                    let posZ = Float(z * gap)
                    nodes[index].position.y = posY
                    nodes[index].position.x = posX
                    nodes[index].position.z = posZ
                    nodes[index].position.z -= deltaTime * 2
                    nodes[index].position.y -= deltaTime * 2
                    nodes[index].scale = SIMD3<Float>(repeating: 0.3)
                    index += 1
                }
            }
        }
        super.update(deltaTime: deltaTime)
    }
}
