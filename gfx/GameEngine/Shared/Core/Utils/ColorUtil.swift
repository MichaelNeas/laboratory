import simd

class ColorUtil {
    static var randomColor: SIMD4<Float> {
        SIMD4<Float>(Float.randomZeroToOne, Float.randomZeroToOne, Float.randomZeroToOne, 1.0)
    }
}
