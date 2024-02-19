import MetalKit


class GameObject: Node {
    var modelConstants = ModelConstants()
    private var material = Material()
    private var textureType = TextureTypes.none
    
    var mesh: Mesh
    
    init(meshType: MeshTypes) {
        mesh = Entities.Meshes[meshType]
    }
    
    override func update() {
        updateModelConstants()
        super.update()
    }
    
    private func updateModelConstants() {
        modelConstants.modelMatrix = self.modelMatrix
    }
}

extension GameObject: Renderable {
    func doRender(_ renderCommandEncoder: MTLRenderCommandEncoder) {
        // lines allows you to see the outlines vs filled up
//        renderCommandEncoder.setTriangleFillMode(.lines)
        // each game object will have it's own render pipeline state
        renderCommandEncoder.setRenderPipelineState(Graphics.RenderPipelineStates[.Basic])
        // every time we render check the depth
        renderCommandEncoder.setDepthStencilState(Graphics.DepthStencilStates[.Less])
        
        // Vertex Shader
        // set buffer in device space
//        renderCommandEncoder.setVertexBuffer(mesh.vertexBuffer, offset: 0, index: 0)
        // use bytes when <4k data
        renderCommandEncoder.setVertexBytes(&modelConstants, length: ModelConstants.stride, index: 2)
        
        // Fragment Shader
        renderCommandEncoder.setFragmentSamplerState(Graphics.SamplerStates[.linear], index: 0)
        renderCommandEncoder.setFragmentBytes(&material, length: Material.stride, index: 1)
        if material.useTexture {
            renderCommandEncoder.setFragmentTexture(Entities.Textures[textureType], index: 0)
        }
        
        // start with the top vertice and move counter clockwise
        mesh.drawPrimitives(renderCommandEncoder)
    }
}

// model constants are a way of transfering movement information on our object to GPU

// MARK: Material
extension GameObject {
    func setMaterialColor(_ color: SIMD4<Float>) {
        material.color = color
        material.useMaterialColor = true
        material.useTexture = false
    }
    
    func setTexture(_ textureType: TextureTypes) {
        self.textureType = textureType
        material.useTexture = true
        material.useMaterialColor = false
    }
    
    // Is lit
    func setMaterialIsLit(_ isLit: Bool) { material.isLit = isLit }
    var materialIsLit: Bool { material.isLit }
    
    // Ambient
    func setMaterialAmbient(_ ambient: SIMD3<Float>) { material.ambient = ambient }
    func setMaterialAmbient(_ ambient: Float) { material.ambient = SIMD3<Float>(ambient, ambient, ambient) }
    func addMaterialAmbient(_ value: Float) { material.ambient += value }
    var matrialAmbient: SIMD3<Float> { material.ambient }
}

extension LightObject {
    // Light Color
    func setLightColor(_ color: SIMD3<Float>) { lightData.color = color }
    var lightColor: SIMD3<Float> { lightData.color }
    
    // Light Brightness
    func setLightBrightness(_ brightness: Float) { lightData.brightness = brightness }
    var lightBrightness: Float { lightData.brightness }
    
    // Ambient Intensity
    func setLightAmbientIntensity(_ intensity: Float) { lightData.ambientIntensity = intensity }
    var lightIntensity: Float { lightData.ambientIntensity }
}
