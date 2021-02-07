/**
 * Definition for a binary tree node.
 * public class TreeNode {
 *     public var val: Int
 *     public var left: TreeNode?
 *     public var right: TreeNode?
 *     public init() { self.val = 0; self.left = nil; self.right = nil; }
 *     public init(_ val: Int) { self.val = val; self.left = nil; self.right = nil; }
 *     public init(_ val: Int, _ left: TreeNode?, _ right: TreeNode?) {
 *         self.val = val
 *         self.left = left
 *         self.right = right
 *     }
 * }
 */
class Solution {
    func sumEvenGrandparent(_ root: TreeNode?) -> Int {
        func recursion(_ root: TreeNode?, parent: TreeNode? = nil, grandParent: TreeNode? = nil) -> Int {
            if let root = root {
                let left = recursion(root.left, parent: root, grandParent: parent)
                let right = recursion(root.right, parent: root, grandParent: parent)
                let current = grandParent != nil && (grandParent?.val ?? 1) % 2 == 0 ? root.val : 0
                return left + right + current
            } else {
                return 0
            }
        }
        
        return recursion(root)
    }

    func sumEvenGrandparentIterative(_ root: TreeNode?) -> Int {
        guard let root = root else { return 0 }
        var queue = [root]
        var sum = 0
        
        func checkParent(node: TreeNode, grandParentValue: Int) {
            queue.append(node)
            if let left = node.left {
                checkKid(node: left, with: grandParentValue)
            }
            if let right = node.right {
                checkKid(node: right, with: grandParentValue)
            }
        }

        func checkKid(node: TreeNode, with grandParent: Int) {
            if grandParent % 2 == 0 {
                sum += node.val
            }
        }
        
        while !queue.isEmpty {
            let node = queue.removeFirst()
            if let left = node.left {
                checkParent(node: left, grandParentValue: node.val)
            }
            if let right = node.right {
                checkParent(node: right, grandParentValue: node.val)
            }
        }
        return sum
    }
}