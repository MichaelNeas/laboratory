// Given an n-ary tree, return the level order traversal of its nodes' values.
// Nary-Tree input serialization is represented in their level order traversal, each group of children is separated by the null value (See examples).


/**
 * Definition for a Node.
 * public class Node {
 *     public var val: Int
 *     public var children: [Node]
 *     public init(_ val: Int) {
 *         self.val = val
 *         self.children = []
 *     }
 * }
 */

class Solution {
    func levelOrder(_ root: Node?) -> [[Int]] {
        guard let first = root else { return [] }
        var solution = [[first.val]]
        var queue = first.children
        while !queue.isEmpty {
            solution.append(queue.map{ $0.val })
            queue = queue.flatMap { $0.children }
        }
        
        return solution
    }
}