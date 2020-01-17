/// Given a non-empty binary tree, return the average value of the nodes on each level in the form of an array. 
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
    func averageOfLevels(_ root: TreeNode?) -> [Double] {
        guard let root = root else { return [] }
        var sol = [Double]()
        var queue = [root]
        while !queue.isEmpty {
            var copyQ = queue
            queue = []
            var sum = 0
            for node in copyQ {
                sum += node.val
                if node.left != nil {
                    queue.append(node.left!)
                }
                if node.right != nil {
                    queue.append(node.right!)
                }
            }
            sol.append(Double(sum)/Double(copyQ.count))
        }
        return sol
    }
}