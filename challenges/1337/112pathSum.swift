/// Given a binary tree and a sum, determine if the tree has a root-to-leaf path such that adding up all the values along the path equals the given sum.
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
    func hasPathSum(_ root: TreeNode?, _ sum: Int) -> Bool {
        func summer(_ rootie: TreeNode?, _ counter: Int) -> Bool {
            guard let rootie = rootie else { return false }
            if (counter + rootie.val) == sum, rootie.left == nil && rootie.right == nil {
                return true
            } else {
                return summer(rootie.left, counter + rootie.val) || summer(rootie.right, counter + rootie.val)
            }
        }
        
        return summer(root, 0)
    }
}