/**
 * BFS FTW
 * Given a binary tree, find its minimum depth.
 * The minimum depth is the number of nodes along the shortest path from the root node down to the nearest leaf node.
 * Note: A leaf is a node with no children.
 * Definition for a binary tree node.
 * function TreeNode(val) {
 *     this.val = val;
 *     this.left = this.right = null;
 * }
 */
/**
 * @param {TreeNode} root
 * @return {number}
 */
var minDepth = function(root) {
    if(root)
        return depthFinder([root],1)
    else 
        return 0
};

let depthFinder = (nodes, depth) => {
    let nextNodes = []
    for(let i=0;i<nodes.length;i++){
        if(nodes[i].left == null && nodes[i].right == null)
            return depth
        else {
            if(nodes[i].left)
                nextNodes.push(nodes[i].left)
            if(nodes[i].right)
                nextNodes.push(nodes[i].right)
        }
    }
    return depthFinder(nextNodes, depth+1)
}