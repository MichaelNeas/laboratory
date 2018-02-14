//test solutions for linked list questions
const singlyLinkedList =  require('./linkedList').singlyLinkedList;
const node =  require('./linkedList').node;


let bleh = new singlyLinkedList();
bleh.insert(node(1));
bleh.insert(node(5));
bleh.insert(node(9));
bleh.insert(node(14));
bleh.print();
bleh.insert(node(20));
console.log(bleh.find(14));
console.log(bleh.find(24));
bleh.remove(node(1));
bleh.remove(node(20));
bleh.print();
bleh.insert(node(42));
bleh.insert(node(73));
bleh.insert(node(23));
bleh.insert(node(3));
bleh.print();
console.log('found ' + bleh.findNth(5).value);
console.log('remove that meow!');
bleh.removeNth(5);
bleh.print();