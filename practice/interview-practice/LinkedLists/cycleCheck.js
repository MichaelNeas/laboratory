//Check if a linked list has cycles
const SinglyLinkedList =  require('./linkedList').singlyLinkedList;
const node =  require('./linkedList').node;
const floydsLL = new SinglyLinkedList();

floydsLL.insert(node(1));
floydsLL.insert(node(2));
let cycle = node(3);
floydsLL.insert(cycle);
floydsLL.insert(node(4));
floydsLL.insert(node(5));
floydsLL.insert(cycle);

//Implementation of Floyds cycle checker algy
function hasLoop(node) {
    let slow = node;
    let fast = node;

    while(fast !== null && fast.next !== null) {
        slow = slow.next;          // 1 hop
        fast = fast.next.next;     // 2 hops 
        if(slow === fast) 
            return true;
    }
    return false;  
}

//warning, dont print this linked list unless you want to see a big list of 3,4,5
console.log(hasLoop(floydsLL.getHead()));