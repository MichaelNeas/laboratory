import MetalKit

final class Cruiser: GameObject {
    init() {
        super.init(meshType: .Cruiser)
        self.name = "Cruiser"
        setTexture(.Cruiser)
    }
}
