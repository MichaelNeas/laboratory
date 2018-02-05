//Implement a BST with insert and delete functions
function Node(val){
    return {
        val: val,
        left: null,
        right: null
    }
}

module.exports.BinarySearchTree = function(){
    let tree = { root: null };

    let _insertHelper = (root, val) => {
        if(root === null){
            root = new Node(val);
            return root;
        } 
        if(root.val < val) root.left = _insertHelper(root.left, val);
        else if(root.val > val) root.right = _insertHelper(root.right, val);
        return root;
    }

    let _deleteHelper = (root, val) => {
        if(root === null) return root;
        if(root.val < val) root.left = _deleteHelper(root.left, val);
        else if(root.val > val) root.right = _deleteHelper(root.right, val);
        else{
            if (root.left == null) return root.right;
            else if (root.right == null) return root.left;
            root.val = (node => {
                let min = node.val;
                while(node.left !== null){
                    min = node.left.val;
                    node = node.left
                }
                return min;
            })(root.right)
            root.right = _deleteHelper(root.right, root.val);
        }
        return root;
    }
    return {
        print: () => JSON.stringify(tree.root, null, 2),
        insert: val => tree.root = _insertHelper(tree.root, val),
        delete: node => tree.root = _deleteHelper(tree.root, node),
        getTree: () => tree
    }
}