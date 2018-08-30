/**
 * Given an integer array with no duplicates. A maximum tree building on this array is defined as follow:
 * The root is the maximum number in the array.
 * The left subtree is the maximum tree constructed from left part subarray divided by the maximum number.
 * The right subtree is the maximum tree constructed from right part subarray divided by the maximum number.
 * Construct the maximum tree by the given array and output the root node of this tree. 
 * Definition for a binary tree node.
 * 
 * This is also called a Cartesian Tree. One interesting property is that if we do an in-order traversal, we get the array back which we used to create it.
 * 
 * function TreeNode(val) {
 *     this.val = val;
 *     this.left = this.right = null;
 * }
 */
/**
 * @param {number[]} nums
 * @return {TreeNode}
 */
var constructMaximumBinaryTree = function(nums) {
    let tree = new TreeNode(nums.shift());
    let checkMax = (curr, peepingNode) => {
        if(!peepingNode){
            return curr
        }
        
        if(curr.val >= peepingNode.val){
            curr.left = peepingNode
            return curr
        }else{
            peepingNode.right = checkMax(curr, peepingNode.right)
            return peepingNode
        }
        
    }
    
    // Go through and insert all values into the tree
    for(let i=0;i<nums.length;i++){
        tree = checkMax(new TreeNode(nums[i]), tree)
    }
    
    return tree
};