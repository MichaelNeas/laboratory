//Given a circular linked list, find the node at the beginning of the loop. Example: A--&gt;B--&gt;C --&gt; D--&gt;E --&gt;C, C is the node that begins the loop
const SinglyLinkedList =  require('./linkedList').singlyLinkedList;
const node =  require('./linkedList').node;
const anotherLL = new SinglyLinkedList();

anotherLL.insert(node('A'));
anotherLL.insert(node('B'));
anotherLL.insert(node('A'));
anotherLL.insert(node('B'));
anotherLL.insert(node('A'));
anotherLL.insert(node('B'));
anotherLL.insert(node('A'));
anotherLL.insert(node('B'));
let cycle = node('C');
anotherLL.insert(cycle);
anotherLL.insert(node('D'));
anotherLL.insert(node('E'));
anotherLL.insert(node('F'));
anotherLL.insert(node('D'));
anotherLL.insert(node('E'));
anotherLL.insert(node('F'));
anotherLL.insert(cycle);

/*
* When your pointers meet, you’ll be as many nodes away from the starting point of the loop 
* as the starting of the loop is away from the start of the linked list.
*/
function findHeadOfLoop(node) {
    let slow = node;
    let fast = node;

    while(fast !== null && fast.next !== null) {
        slow = slow.next;          // 1 hop
        fast = fast.next.next;     // 2 hops 
        if(slow === fast) 
            return fast.value;
    }
    return false;  
}

//warning, dont print this linked list unless you want to see a big list of 3,4,5
console.log(findHeadOfLoop(anotherLL.getHead()));