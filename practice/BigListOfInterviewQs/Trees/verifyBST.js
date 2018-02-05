//Write a function that determines if a tree is a BST

_verifyBSTHelper = node => {
    if(node.left !== null){
        if(node.left.val < node.val)
            _verifyBSTHelper(node.left);
        else if(node.left.val > node.val) return false;
    }
    if(node.right !== null){
        if(node.right.val > node.val)
            _verifyBSTHelper(node.right);
        else if(node.right.val < node.val) return false;
    }
    return true;
}

module.exports.verifyBST = tree => _verifyBSTHelper(tree.root);