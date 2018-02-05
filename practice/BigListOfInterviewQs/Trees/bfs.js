// breadth first search
const Queue = require('../StacksQueuesHeaps/queue');

module.exports.BreadthFirstSearch = function(tree){
    
    let nonVisitedNodes = new Queue();
    let visitedNodes = new Array();
    visitedNodes[tree.root.val] = true;
    nonVisitedNodes.enqueue(tree.root);
    
    while(nonVisitedNodes.size() !== 0){
        let curr = nonVisitedNodes.dequeue()[0];
        console.log(`BFS touched ${curr.val}`);
        if(curr.left !== null && !visitedNodes[curr.left.val]){
            visitedNodes[curr.left.val] = true;
            nonVisitedNodes.enqueue(curr.left);
        }
        if(curr.right !== null && !visitedNodes[curr.right.val]){
            visitedNodes[curr.right.val] = true;
            nonVisitedNodes.enqueue(curr.right);
        }
    }
}