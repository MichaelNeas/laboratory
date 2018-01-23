//Implement a linked list (with insert and delete functions)

const node = data => {
    return {
        value: data,
        next: null
    }
}

function singlyLinkedList(){
    let head = null;
    const insert = node => {
        if (head)
            node.next = head;
        head = node;
        console.log('Added:', node.value)
    }
    const readList = () => {
        let tempNode = head;
        while(tempNode != null){
            console.log(tempNode.value)
            tempNode = tempNode.next;
        }
    }
    return {
        insert: insert,
        print: readList
    }
}

let bleh = singlyLinkedList()
bleh.insert(node(1));
bleh.insert(node(5));
bleh.insert(node(9));
bleh.insert(node(12));
bleh.insert(node(2));
bleh.insert(node(14));
bleh.print();
bleh.insert(node(20));
bleh.print();

module.exports = singlyLinkedList;