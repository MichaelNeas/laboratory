//Find the distance between 2 nodes in a BST and a normal binary tree
const someTree = require('./treeData.json');
const Stack = require('../StacksQueuesHeaps/stack');

function distanceBetweenNodes(tree, nodeA, nodeB){
    let nonVisitedNodes = new Stack();
    nonVisitedNodes.push({distance: -1, node: tree.root});
    
    while(nonVisitedNodes.size() > 0){
        let curr = nonVisitedNodes.pop();
        if(curr.node.val === nodeA) {
            curr.distance = 0; //start finding the distance
            nonVisitedNodes.clear(); //we don't care about the other side of the tree anymore
        }
        
        if(curr.node.left){
            if(curr.distance !== -1){
                if(curr.node.left.val === nodeB){
                    return curr.distance + 1;
                }else
                    nonVisitedNodes.push({distance:curr.distance++, node: curr.node.left});
            }else
                nonVisitedNodes.push({distance:curr.distance, node: curr.node.left});
        }

        if(curr.node.right){
            if(curr.distance !== -1){
                if(curr.node.right.val === nodeB) {
                    return curr.distance + 1;
                }else
                    nonVisitedNodes.push({distance:curr.distance++, node: curr.node.right});
            }else
                nonVisitedNodes.push({distance:curr.distance, node: curr.node.right});
        }
    }
    return -1;
}

let nodeChecker = (parent, direction) => {
    if(parent.distance !== -1){
        if(parent.node[direction].val === nodeB) {
            return parent.distance + 1;
        }else
            nonVisitedNodes.push({distance:parent.distance++, node: parent.node[direction]});
    }else
        nonVisitedNodes.push({distance:parent.distance, node: parent.node[direction]});
}

console.log(distanceBetweenNodes(someTree, 142, 3));
console.log(distanceBetweenNodes(someTree, 142, 16));
console.log(distanceBetweenNodes(someTree, 37, 10));
console.log(distanceBetweenNodes(someTree, 37, 34));
console.log(distanceBetweenNodes(someTree, 37, 12));
console.log(distanceBetweenNodes(someTree, 182, 120));