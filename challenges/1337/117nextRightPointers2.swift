/**
 * Populate each next pointer to point to its next right node. 
 * If there is no next right node, the next pointer should be set to NULL.
 * Initially, all next pointers are set to NULL.
 * Definition for a Node.
 * public class Node {
 *     public var val: Int
 *     public var left: Node?
 *     public var right: Node?
 *	   public var next: Node?
 *     public init(_ val: Int) {
 *         self.val = val
 *         self.left = nil
 *         self.right = nil
 *         self.next = nil
 *     }
 * }
 */

class Solution {
    func connect(_ root: Node?) -> Node? {
        guard let root = root else { return nil }
        var queue = [root]
        var level = [Node]()
        while !queue.isEmpty || !level.isEmpty {
            if queue.isEmpty {
                if level.count > 1 {
                    for i in 1..<level.count {
                        level[i-1].next = level[i]
                    }
                }
                queue = level
                level = []
            }
            let node = queue.removeFirst()
            if let left = node.left {
                level.append(left)
            }
            if let right = node.right {
                level.append(right)
            }
        }
        return root
    }
}