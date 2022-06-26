import Foundation

final class Node {
    var val: Int
    var left: Node?
    var right: Node?
    
    init(val: Int, left: Node? = nil, right: Node? = nil) {
        self.val = val
        self.left = left
        self.right = right
    }
}

final class Tree {
    let root = Node(val: 5,
                    left: Node(val: 3, left: Node(val: 1), right: Node(val: 4)),
                    right: Node(val: 7, left: Node(val: 6), right: Node(val:10))
                    )
    
    func contains(value: Int) -> Bool {
        contains(current: root, goal: value)
    }
    
    private func contains(current: Node?, goal: Int) -> Bool {
        guard current != nil else { return false }

        if current!.val == goal {
            return true
        } else {
            return contains(current: current!.left, goal: goal) || contains(current: current!.right, goal: goal)
        }
    }
}


let tree = Tree()
tree.contains(value: 5)
tree.contains(value: 4)
tree.contains(value: 12)
tree.contains(value: 0)
tree.contains(value: 6)
tree.contains(value: 7)
tree.contains(value: 1)
tree.contains(value: 3)
tree.contains(value: 15)
tree.contains(value: 2)

