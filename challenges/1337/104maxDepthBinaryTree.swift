/// Given a binary tree, find its maximum depth.
/// The maximum depth is the number of nodes along the longest path from the root node down to the farthest leaf node.
/// Note: A leaf is a node with no children.

/**
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
    func maxDepth(_ root: TreeNode?) -> Int {
        guard let root = root else { return 0 }
        let left = maxDepth(root.left) + 1
        let right = maxDepth(root.right) + 1
        return left > right ? left : right
    }
}