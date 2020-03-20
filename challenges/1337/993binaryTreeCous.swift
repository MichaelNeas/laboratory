/**
 *  In a binary tree, the root node is at depth 0, and children of each depth k node are at depth k+1.
 *  Two nodes of a binary tree are cousins if they have the same depth, but have different parents.
 *  We are given the root of a binary tree with unique values, and the values x and y of two different nodes in the tree.
 *  Return true if and only if the nodes corresponding to the values x and y are cousins.
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
    func isCousins(_ root: TreeNode?, _ x: Int, _ y: Int) -> Bool {
        guard let root = root else { return false }
        
        func find(_ root: TreeNode?, _ val: Int, _ depth: Int) -> (Int, Int)? {
            if let root = root {
                if root.left?.val == val {
                    return (root.val, depth + 1)
                }
                
                if root.right?.val == val {
                    return (root.val, depth + 1)
                }  
                
                return find(root.left, val, depth + 1) ?? find(root.right, val, depth + 1)
            } else {
                return nil
            }
        }
        
        guard let xSearch = find(root, x, 0), let ySearch = find(root, y, 0) else { return false }
        return xSearch.0 != ySearch.0 && ySearch.1 == xSearch.1
    }
}