/**
 * Consider all the leaves of a binary tree.  From left to right order, the values of those leaves form a leaf value sequence.
 * Return true if and only if the two given trees with head nodes root1 and root2 are leaf-similar.
 * Definition for a binary tree node.
 * function TreeNode(val) {
 *     this.val = val;
 *     this.left = this.right = null;
 * }
 */

let inOrderTraversal = node => {
    if (node == null) return []
 
    // first recur on left child
    let left = inOrderTraversal(node.left);
    // now recur on right child 
    let right = inOrderTraversal(node.right);
    
    let val;
    if (node.left == null && node.right == null){
        val = node.val
    }
    return left + [val] + right
}

/**
 * @param {TreeNode} root1
 * @param {TreeNode} root2
 * @return {boolean}
 */
var leafSimilar = function(root1, root2) {
    let one = inOrderTraversal(root1)
    let two = inOrderTraversal(root2)
    return one == two
};

//different sol with dfs
var leafSimilar = function(root1, root2) {
    let tree1Leaves = [];
    let tree2Leaves = [];
    
    function dfs(node, arr) {
        if(!node.left && !node.right) {
            arr.push(node.val);
        }
        
        if(node.left) dfs(node.left, arr);
        if(node.right) dfs(node.right, arr);
    }
    
    dfs(root1, tree1Leaves);
    dfs(root2, tree2Leaves);
    
    return checkEquality(tree1Leaves, tree2Leaves);
};

function checkEquality(arr1, arr2) {
    return JSON.stringify(arr1) === JSON.stringify(arr2);
}