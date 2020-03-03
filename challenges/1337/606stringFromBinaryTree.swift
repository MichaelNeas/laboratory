/**
 * You need to construct a string consists of parenthesis and integers from a binary tree with the preorder traversing way.
 * The null node needs to be represented by empty parenthesis pair "()". And you need to omit all the empty parenthesis 
 * pairs that don't affect the one-to-one mapping relationship between the string and the original binary tree.
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
    
    func tree2str(_ t: TreeNode?) -> String {
        guard let node = t else { return "" }
        var sol = node.val.description

        if node.left == nil && node.right != nil {
            sol.append("()")
        } else if node.left != nil {
            sol.append("(\(tree2str(node.left)))")
        }
        if node.right != nil {
            sol.append("(\(tree2str(node.right)))")
        }
        return sol
    }
}

class Solution2 {
    var sol = ""
    func tree2str(_ t: TreeNode?) -> String {
        if let node = t {
            sol.append("\(node.val)")
            
                
            if node.left == nil && node.right != nil {
                sol.append("()")
            } else if node.left != nil {
                sol.append("(")
                tree2str(node.left)
                sol.append(")")
            }
                
            if node.right != nil {
                sol.append("(")
                tree2str(node.right)
                sol.append(")")
            }
            
        } else {
            return ""
        }
        return sol
    }
}