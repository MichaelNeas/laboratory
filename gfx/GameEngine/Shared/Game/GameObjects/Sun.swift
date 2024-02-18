import simd

final class Sun: LightObject {
    init() {
        super.init(meshType: .Sphere, name: "Sun")
        setColor(SIMD4<Float>(0.5, 0.5, 0, 1.0))
        setScale(0.3)
    }
}
