/**
 * Given a binary tree, return the sum of values of its deepest leaves. 
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
    func deepestLeavesSum(_ root: TreeNode?) -> Int {
        guard let root = root else { return 0 }
        var levels = [root]
        var newLevels = [root]
        while !newLevels.isEmpty {
            levels = newLevels
            newLevels = []
            for node in levels {
                if let left = node.left {
                    newLevels.append(left)
                }
                if let right = node.right {
                    newLevels.append(right)
                }
            }
        }
        return levels.reduce(0, { $0 + $1.val })
    }
}