/**
 * We are given the head node root of a binary tree, where additionally every node's value is either a 0 or a 1.
 * Return the same tree where every subtree (of the given tree) not containing a 1 has been removed.
 * (Recall that the subtree of a node X is X, plus every node that is a descendant of X.)
 * Definition for a binary tree node.
 * function TreeNode(val) {
 *     this.val = val;
 *     this.left = this.right = null;
 * }
 */
/**
 * @param {TreeNode} root
 * @return {TreeNode}
 */
var pruneTree = function(root) {
    if (root) {
        if(!root.left && !root.right && root.val === 0){
            return null
        } else{
            root.left = pruneTree(root.left)
            root.right = pruneTree(root.right)
            if (!root.left && !root.right && root.val === 0){
                return null
            }
        }
    }
    return root
};