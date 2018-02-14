//Given a binary tree which is a sum tree (child nodes add to parent), write an algorithm to determine whether the tree is a valid sum tree
const sumTree = require('./treeData.json');

let summer = node => {
    if(node == null) return 0;
    return summer(node.left) + node.val + summer(node.right);
}

function isValidSumTree(node){
    if(node === null) return;
    let leftsum  = summer(node.left);
    let rightsum = summer(node.right);
    console.log(leftsum, rightsum)
    if(node.val === leftsum + rightsum) return true;
    else return false;
}

console.log(isValidSumTree(sumTree.root));