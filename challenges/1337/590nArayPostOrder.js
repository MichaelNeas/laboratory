/**
 * Given an n-ary tree, return the postorder traversal of its nodes' values.
 * // Definition for a Node.
 * function Node(val,children) {
 *    this.val = val;
 *    this.children = children;
 * };
 */
/**
 * @param {Node} root
 * @return {number[]}
 */
var postorder = function(root) {
    var sol = []
    
    if (!root) {
        return sol
    }
    
    if (!root.children) {
        return [root.val]
    }
    
    for(var i = 0; i<root.children.length; i++) {
        sol = sol.concat(postorder(root.children[i]))
    }
    
    sol.push(root.val)
    
    return sol
};