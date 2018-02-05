const bst = require('./bst').BinarySearchTree();
const bfs = require('./bfs').BreadthFirstSearch;
const dfs = require('./dfs').DepthFirstSearch;

bst.insert(5);
bst.insert(7);
bst.insert(2);
bst.insert(8);
bst.insert(1);
bst.insert(4);
console.log(bst.print());
bst.delete(5);
console.log(bst.print());
console.log('--------BFS Print-------');
bfs(bst.getTree());
console.log('--------BFS Done-------');
console.log('--------DFS Print-------');
dfs(bst.getTree());
console.log('--------DFS Done-------');
