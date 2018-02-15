const someTree = require('./treeData.json');

//(a) Inorder (Left, Root, Right) 
const printInorder = node => {
    if (node === null) return;

    /* first recur on left child */
    printInorder(node.left);

    /* then print the data of node */
    console.log(`${node.val}`);

    /* now recur on right child */
    printInorder(node.right);
}

//(b) Preorder (Root, Left, Right) 
const printPreorder = node => {
    if (node === null) return;

    /* first print data of node */
    console.log(`${node.val}`);

    /* then recur on left sutree */
    printPreorder(node.left);  

    /* now recur on right subtree */
    printPreorder(node.right);
}    




//(c) Postorder (Left, Right, Root)
const printPostorder = node => {
    if (node === null)
        return;

    // first recur on left subtree
    printPostorder(node.left);

    // then recur on right subtree
    printPostorder(node.right);

    // now deal with the node
    console.log(`${node.val}`);
}

console.log('In Order');
printInorder(someTree.root);
console.log('Pre Order');
printPreorder(someTree.root);
console.log('Post Order');
printPostorder(someTree.root);