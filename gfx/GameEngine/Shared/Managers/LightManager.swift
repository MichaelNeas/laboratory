import MetalKit

final class LightManager {
    private var lightObjects: [LightObject] = []
    
    func add(lightObject: LightObject) {
        lightObjects.append(lightObject)
    }
    
    func gatherLightData() -> [LightData] {
        lightObjects.map(\.lightData)
    }
    
    func setLightData(_ renderCommandEncoder: MTLRenderCommandEncoder) {
        var lightData = gatherLightData()
        // send all our light data into the GPU
        renderCommandEncoder.setFragmentBytes(&lightData,
                                              length: LightData.size(lightData.count),
                                              index: 2)
    }
}
