const bst = require('./bst').BinarySearchTree();
const bfs = require('./bfs').BreadthFirstSearch;
const dfs = require('./dfs').DepthFirstSearch;
const verify = require('./verifyBST').verifyBST;

bst.insert(5);
bst.insert(7);
bst.insert(2);
bst.insert(8);
bst.insert(1);
bst.insert(4);
bst.insert(17);
bst.insert(12);
bst.insert(89);
bst.insert(6);
console.log(bst.print());
bst.delete(5);
console.log(bst.print());
console.log('--------Verify BST-------');
console.log(`Is this tree a bst? ${verify(bst.getTree())}`);
console.log('--------Verification Complete-------');
console.log('--------BFS Print-------');
bfs(bst.getTree());
console.log('--------BFS Done-------');
console.log('--------DFS Print-------');
dfs(bst.getTree());
console.log('--------DFS Done-------');
console.log(`MINIMUM element is ${bst.getMin()}`);
console.log(`Second Max element is ${bst.getSecondMax()}`);

const badTree = {
    "root" : {
        "val": 7,
        "left": {
            "val": 9,
            "left": {
                "val": 1,
                "left": null,
                "right": null
            },
            "right": {
                "val": 4,
                "left": null,
                "right": null
            }
            },
        "right": {
            "val": 8,
            "left": null,
            "right": null
        }
    }
};

console.log('--------Verify BST on a bad tree-------');
console.log(`Is this tree a bst? ${verify(badTree)}`);
console.log('--------Verification Complete-------');