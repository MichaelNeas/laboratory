//Reverse a linked list iteratively and recursively
const SinglyLinkedList =  require('./linkedList').singlyLinkedList;
const node =  require('./linkedList').node;
const sll = new SinglyLinkedList();


function recursiveReversal(linkedList){
    let node = linkedList.getHead();
    recursiveHelper(node, null)
    linkedList.print();
}

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


sll.insert(node('a'));
sll.insert(node('b'));
sll.insert(node('c'));
sll.insert(node('d'));
sll.insert(node('e'));
console.log('starting out we have');
sll.print();
console.log('switch it up');
recursiveReversal(sll);