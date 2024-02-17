
enum Entities {
    private static var meshLibrary: MeshLibrary!
    static var Meshes: MeshLibrary { meshLibrary }
    
    private static var textureLibrary: TextureLibrary!
    static var Textures: TextureLibrary { textureLibrary }
    
    static func Initialize() {
        self.meshLibrary = MeshLibrary()
        self.textureLibrary = TextureLibrary()
    }
}
