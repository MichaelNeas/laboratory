/**
 * A binary tree is univalued if every node in the tree has the same value.
 * Return true if and only if the given tree is univalued.
 *
 * Definition for a binary tree node.
 * public class TreeNode {
 *     public var val: Int
 *     public var left: TreeNode?
 *     public var right: TreeNode?
 *     public init(_ val: Int) {
 *         self.val = val
 *         self.left = nil
 *         self.right = nil
 *     }
 * }
 */
class Solution {
    func isUnivalTree(_ root: TreeNode?) -> Bool {
        guard let root = root else { return true }
        let desiredValue = root.val 
        func traverse(_ node: TreeNode?) -> Bool {
            guard let goodNode = node?.val else { return true }
            guard goodNode == desiredValue else { return false }
            return traverse(node?.left) && traverse(node?.right)
        }
        return traverse(root)
    }
}