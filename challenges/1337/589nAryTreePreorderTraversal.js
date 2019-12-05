/**
 * Given an n-ary tree, return the preorder traversal of its nodes' values.
 * 
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


var preorder = function(root) {
    let sol = []
    function recurse(node){
        if(!node || !node.children) return sol;
        sol.push(node.val);
        for(let i = 0; i < node.children.length; i++) {
            recurse(node.children[i]);
        }
    }
    
    recurse(root)
    return sol;
};