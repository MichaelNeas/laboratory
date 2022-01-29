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
 Given the root of a binary search tree (BST) with duplicates, return all the mode(s) (i.e., the most frequently occurred element) in it.

If the tree has more than one mode, return them in any order.

Assume a BST is defined as follows:

The left subtree of a node contains only nodes with keys less than or equal to the node's key.
The right subtree of a node contains only nodes with keys greater than or equal to the node's key.
Both the left and right subtrees must also be binary search trees.
 */
class Solution {
    var common = [Int: Int]()
    
    func findMode(_ root: TreeNode?) -> [Int] {
        guard let root = root else { return [] }
        traverse(root)
        var ans = [Int]()
        var max = common[root.val] ?? -1
        for (key, value) in common {
            if value > max {
                max = value
                ans = [key]
            } else if value == max {
                ans.append(key)
            }
        }
        return ans
    }
    
    func traverse(_ root: TreeNode?) {
        guard let root = root else { return }
        common[root.val, default: 0] += 1
        traverse(root.left)
        traverse(root.right)
    }
}