//Depth First Search
let _DFSHelper = (curr, state) => {
    state[curr.val] = true;
    console.log(`Processing ${curr.val}`);
    if(curr.left  !== null && !state[curr.left.val])  _DFSHelper(curr.left, state);
    if(curr.right !== null && !state[curr.right.val]) _DFSHelper(curr.right, state);
}

module.exports.DepthFirstSearch = function(tree){
    let visitedNodes = new Array();
    visitedNodes[tree.root.val] = true;
    _DFSHelper(tree.root, visitedNodes);
}
