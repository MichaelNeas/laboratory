// Given the root node of a binary search tree (BST) and a value. 
// You need to find the node in the BST that the node's value equals the given value. 
// Return the subtree rooted with that node. If such node doesn't exist, you should return NULL.

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
    func searchBST(_ root: TreeNode?, _ val: Int) -> TreeNode? {
        guard let rootVal = root?.val, rootVal != val else { return root }
        return searchBST(rootVal > val ? root?.left : root?.right, val)
    }
}