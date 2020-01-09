/**
 * Given a binary tree, return the inorder traversal of its nodes' values.
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
    func inorderTraversal(_ root: TreeNode?) -> [Int] {
        var val: [Int] = []
        guard let node = root else { return val }
        val += inorderTraversal(node.left)
        val.append(node.val)
        val += inorderTraversal(node.right)
        return val
    }
}