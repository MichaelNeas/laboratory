//Find the sum of all left leaves in a given binary tree.

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
    func sumOfLeftLeaves(_ root: TreeNode?) -> Int {
        guard let root = root else { return 0 }
        guard let left = root.left, 
        left.left == nil, left.right == nil else { 
            return sumOfLeftLeaves(root.left) + sumOfLeftLeaves(root.right) 
        }
        return left.val + sumOfLeftLeaves(root.right)
    }
}