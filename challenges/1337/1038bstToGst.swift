// Given the root of a binary search tree with distinct values, modify it so that every node has 
// a new value equal to the sum of the values of the original tree that are greater than or equal to node.val.
// As a reminder, a binary search tree is a tree that satisfies these constraints:
//     The left subtree of a node contains only nodes with keys less than the node's key.
//     The right subtree of a node contains only nodes with keys greater than the node's key.
//     Both the left and right subtrees must also be binary search trees.


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
    func bstToGst(_ root: TreeNode?) -> TreeNode? {
        guard let root = root else { return nil }
        
        func helper(_ node: TreeNode?, _ total: Int = 0) -> Int {
            guard let node = node else { return total }
            let right = helper(node.right, total)
            node.val += right
            let left = helper(node.left, node.val)
            return left
        }
        
        helper(root)
        return root
    }
}