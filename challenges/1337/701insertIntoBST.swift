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
 * Given the root node of a binary search tree (BST) and a value to be inserted into the tree, insert the value into the BST. 
 * Return the root node of the BST after the insertion. It is guaranteed that the new value does not exist in the original BST.
 * Note that there may exist multiple valid ways for the insertion, as long as the tree remains a BST after insertion. 
 * You can return any of them.
 */
class Solution {
    func insertIntoBST(_ root: TreeNode?, _ val: Int) -> TreeNode? {
        guard let root = root else { return TreeNode(val) }
        if val > root.val {
            root.right = insertIntoBST(root.right, val)
        } else {
            root.left = insertIntoBST(root.left, val)
        }
        return root
    }
}