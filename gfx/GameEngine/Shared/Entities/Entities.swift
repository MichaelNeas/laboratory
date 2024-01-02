
enum Entities {
    private static var meshLibrary: MeshLibrary!
    public static var Meshes: MeshLibrary { meshLibrary }
    
    public static func Initialize() {
        self.meshLibrary = MeshLibrary()
    }
}
