import MetalKit

// Phong = ambient + diffuse + specular (intensities)
// ambient - the environmental lighting, the general lighting around the scene
// diffuse - lighting facing the object
// specular - reflection of light into eyes
// Maths
// vectors - direction & magnitude (length)
// normals - a vector perpendicular to a plane
// dot product - scalar product
// vector subtraction - Head - Tail,
// normalizing - value derived to be in 1 length
// summations - addition of a sequence of any kind of number (for loop)
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
