class Keyboard {
    private static var KEY_COUNT: Int = 256
    private static var keys = [Bool].init(repeating: false, count: KEY_COUNT)
    
    static func setKeyPressed(_ keyCode: UInt16, isOn: Bool) {
        keys[Int(keyCode)] = isOn
    }
    
    static func isKeyPressed(_ keyCode: Keycode) -> Bool {
        keys[Int(keyCode.rawValue)]
    }
}
