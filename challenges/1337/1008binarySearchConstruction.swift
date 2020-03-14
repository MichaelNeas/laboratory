/**
 * Return the root node of a binary search tree that matches the given preorder traversal.
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
    func bstFromPreorderIterative(_ preorder: [Int]) -> TreeNode? {
        guard let first = preorder.first else { return nil }
        var root = TreeNode(first) 
        var current = root
        var i = 1
        while i < preorder.count {
            if preorder[i] < current.val {
                if let left = current.left {
                    current = left
                } else {
                    current.left = TreeNode(preorder[i])
                    current = root
                    i += 1
                }
            } else {
                if let right = current.right {
                    current = right
                }  else {
                    current.right = TreeNode(preorder[i])
                    current = root
                    i += 1
                }
            }
        }
        return root
    }

    func bstFromPreorderRecursive(_ preorder: [Int]) -> TreeNode? {
        guard let first = preorder.first else { return nil }
        var root = TreeNode(first) 
        
        func bstHelper(node: TreeNode, value: Int) {
            if value < node.val {
                if let left = node.left {
                    bstHelper(node: left, value: value)
                } else {
                    node.left = TreeNode(value)
                }
            } else {
                if let right = node.right {
                    bstHelper(node: right, value: value)
                }  else {
                    node.right = TreeNode(value)
                }
            }
        }
        
        for i in 1..<preorder.count {
            bstHelper(node: root, value: preorder[i])
        }
        
        return root
    }
}