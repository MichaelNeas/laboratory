import Foundation

class MTree<T> {
    let value: T
    var children: List<MTree<T>>?

    init(_ value: T, _ children: List<MTree<T>>? = nil) {
        self.value = value
        self.children = children
    }
}
