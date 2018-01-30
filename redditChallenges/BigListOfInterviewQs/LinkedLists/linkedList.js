/*Implement a linked list (with insert and delete functions)
* Singly-Linked List 	
* access Θ(n),	
* search Θ(n) 	
* insert Θ(1) to head
* deletion Θ(n)
*/
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
    const find = val => {
        let tempNode = head;
        while(tempNode != null){
            if(val === tempNode.value){
                return `Found ${val} in node: ${JSON.stringify(tempNode)}`;
            }
            tempNode = tempNode.next;
        }
        return `${val} not found.`
    }
    const findNth = n => {
        let tempNode = head;
        let nth = n;
        while(n > 0){
            if(tempNode.next == null){
                return `list not ${nth} deep`;
            }
            tempNode = tempNode.next;
            n--;
        }
        return `found: ${tempNode.value}, ${nth} deep -- 0 indexed`;
    }
    const remove = node => {
        let tempNode = head;
        if(tempNode.value === node.value){
            console.log(`deletion occuring at the first element`);
            head = tempNode.next;
            return;
        }

        while(tempNode !== null){
            if(node.value === tempNode.next.value){
                console.log(`deletion occuring`);
                tempNode.next = tempNode.next.next;
                return;
            }
            tempNode = tempNode.next;
        }
        return `${val} not able to be removed.`
    }

    return {
        insert: insert,
        find: find,
        findNth: findNth,
        print: readList,
        remove: remove
    }
}

let bleh = singlyLinkedList()
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
console.log(bleh.findNth(5));

module.exports = singlyLinkedList;