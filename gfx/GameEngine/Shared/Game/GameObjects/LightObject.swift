import MetalKit

class LightObject: GameObject {
    
    var lightData = LightData()
    
    init(name: String) {
        super.init(meshType: .none)
        self.name = name
    }
    
    init(meshType: MeshTypes, name: String) {
        super.init(meshType: meshType)
        self.name = name
    }
    
    override func update() {
        lightData.position = position
        super.update()
    }
}
