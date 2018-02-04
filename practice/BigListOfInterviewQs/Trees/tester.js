let bst = require('./bst').BinarySearchTree();

bst.insert(5);
bst.insert(7);
bst.insert(2);
bst.insert(8);
bst.insert(1);
bst.insert(4);
console.log(bst.print());
bst.delete(5);
console.log(bst.print());