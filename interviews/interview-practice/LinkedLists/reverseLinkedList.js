//Reverse a linked list iteratively and recursively
const SinglyLinkedList =  require('./linkedList').singlyLinkedList;
const node =  require('./linkedList').node;
const sll = new SinglyLinkedList();


function recursiveReversal(linkedList){
    let node = linkedList.getHead();
    recursiveHelper(node, null)
    linkedList.print();
}

//global mutation i'm sorry
function recursiveHelper(node, prev){
    if(node.next === null){
        sll.setHead(node); 
        node.next = prev;
        return;
    }
    let tempNext = node.next;
    node.next = prev;
    recursiveHelper(tempNext, node)
}

function iterativeReversal(linkedList){
    let node = linkedList.getHead();
    let prev = null;
    while(node.next !== null){
        let temp = node.next;
        node.next = prev;
        prev = node;
        node = temp;
    }
    node.next = prev;
    linkedList.setHead(node);
    linkedList.print();
}


sll.insert(node('a'));
sll.insert(node('b'));
sll.insert(node('c'));
sll.insert(node('d'));
sll.insert(node('e'));
console.log('starting out we have');
sll.print();
console.log('switch it up');
//recursiveReversal(sll);
iterativeReversal(sll)