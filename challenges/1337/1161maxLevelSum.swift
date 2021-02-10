/**
 * Given the root of a binary tree, the level of its root is 1, the level of its children is 2, and so on.
 * Return the smallest level x such that the sum of all the values of nodes at level x is maximal.
 *
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
 */
class Solution {
    func maxLevelSum(_ root: TreeNode?) -> Int {
        guard let root = root else { return 0 }
        var queue = [root]
        var level = 0
        var maxLevel = (0, Int.min)
        while !queue.isEmpty {
            level += 1
            let sum = queue.reduce(0, { $0 + $1.val })
            if sum > maxLevel.1 {
                maxLevel = (level, sum)
            }
            queue = queue.flatMap{[$0.left, $0.right].compactMap { $0 }}
        }
        
        return maxLevel.0
    }
}