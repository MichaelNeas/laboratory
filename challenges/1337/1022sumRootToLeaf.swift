// Given a binary tree, each node has value 0 or 1.  
// Each root-to-leaf path represents a binary number starting with the most significant bit.  
// For example, if the path is 0 -> 1 -> 1 -> 0 -> 1, then this could represent 01101 in binary, which is 13.
// For all leaves in the tree, consider the numbers represented by the path from the root to that leaf.
// Return the sum of these numbers.

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
    func sumRootToLeaf(_ root: TreeNode?) -> Int {
        func helper(_ root: TreeNode?, _ previous: String) -> Int {
            guard let root = root else { return 0 }
            if root.left == nil && root.right == nil {
                let binary = previous + "\(root.val)"
                return Int(binary, radix: 2)!
            }
            
            var sum = 0
            
            if let left = root.left {
                sum += helper(left, previous + "\(root.val)") 
            }
            
            if let right = root.right {
                sum += helper(right, previous + "\(root.val)") 
            }
            
            return sum
            
        }
        
        return helper(root, "")
    }
}