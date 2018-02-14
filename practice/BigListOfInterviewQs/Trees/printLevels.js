//Print a tree by levels
const someTree = require('./treeData.json');
const Queue = require('../StacksQueuesHeaps/queue');

(function printLevels(tree){
    let nonVisitedNodes = new Queue();
    let levels = new Array();
    nonVisitedNodes.enqueue(tree.root);
    
    while(nonVisitedNodes.size() > 0){
        let levelList = nonVisitedNodes.clone();
        levels.push(levelList);
        nonVisitedNodes.clear();

        levelList.forEach(curr => {
            if(curr.left)  nonVisitedNodes.enqueue(curr.left);
            if(curr.right) nonVisitedNodes.enqueue(curr.right);
        });
    }
    let i;
    for(i=0;i<levels.length;i++){
        let tempLevelString = 'Level ' + i + ': ';
        levels[i].forEach(level => tempLevelString = tempLevelString + level.val + ' ');
        console.log(tempLevelString);
    }

})(someTree);