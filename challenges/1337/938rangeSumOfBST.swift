/// Given the root node of a binary search tree, return the sum of values of all nodes with value between L and R (inclusive).
/// The binary search tree is guaranteed to have unique values.
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
    func rangeSumBST(_ root: TreeNode?, _ L: Int, _ R: Int) -> Int {
        guard var sum = root?.val else { return 0 } 
        if sum < L || sum > R { sum = 0 }
        return sum + rangeSumBST(root?.left, L, R) + rangeSumBST(root?.right, L, R)
    }
}