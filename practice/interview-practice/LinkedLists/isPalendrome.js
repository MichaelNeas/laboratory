//Check whether a link list is a palindrome
const SinglyLinkedList =  require('./linkedList').singlyLinkedList;
const Stack = require('../StacksQueuesHeaps/stack');
const Queue = require('../StacksQueuesHeaps/queue');
const node =  require('./linkedList').node;
const sll = new SinglyLinkedList();
const history = new Stack();
const orderedHistory = new Queue();


function isPalendrome(linkedList){
    let node = linkedList.getHead();
    while(node !== null){
        history.push(node.value);
        orderedHistory.enqueue(node.value);
        node = node.next;
    }

    console.log('comparison time');

    while(orderedHistory.size() > 0){
        if(orderedHistory.dequeue() !== history.pop()) 
            return false;
    }
    return true;
}


sll.insert(node('a'));
sll.insert(node('b'));
sll.insert(node('c'));
sll.insert(node('b'));
sll.insert(node('a'));
console.log(isPalendrome(sll));