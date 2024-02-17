import MetalKit

enum TextureTypes {
    case none
    case PartyPirateParot
}

final class TextureLibrary: Library<TextureTypes, MTLTexture> {
    private var library: [TextureTypes: Texture] = [:]
    
    override func fillLibrary() {
        library.updateValue(Texture("PartyPirateParot"), forKey: .PartyPirateParot)
    }
    
    override subscript(type: TextureTypes) -> MTLTexture? {
        library[type]?.texture
    }
}

final class Texture {
    var texture: MTLTexture
    
    init(_ textureName: String, ext: String = "png", origin: MTKTextureLoader.Origin = .topLeft) {
        let textureLoader = TextureLoader(textureName: textureName, textureExtension: ext, origin: origin)
        let texture: MTLTexture = textureLoader.loadTextureFromBundle()!
        self.texture = texture
    }
}

final class TextureLoader {
    private var textureName: String
    private var textureExtension: String
    private var origin: MTKTextureLoader.Origin
    
    init(textureName: String, textureExtension: String = "png", origin: MTKTextureLoader.Origin) {
        self.textureName = textureName
        self.textureExtension = textureExtension
        self.origin = origin
    }
    
    func loadTextureFromBundle() -> MTLTexture? {
        guard let url = Bundle.main.url(forResource: textureName, withExtension: textureExtension) else { return nil }
        let textureLoader = MTKTextureLoader(device: Engine.Device)
        let options = [MTKTextureLoader.Option.origin: origin]
        let res = try? textureLoader.newTexture(URL: url, options: options)
        res?.label = textureName
        return res
    }
}
