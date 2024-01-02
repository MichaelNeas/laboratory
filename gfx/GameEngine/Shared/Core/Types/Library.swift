
class Library<T, K> {
    init() {
        fillLibrary()
    }
    
    func fillLibrary() {
        // Override in subclass
    }
    
    subscript(_ type: T)->K? {
        return nil
    }
}
