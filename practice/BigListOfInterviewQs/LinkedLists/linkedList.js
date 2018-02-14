/*Implement a linked list (with insert and delete functions)
* Singly-Linked List 	
* access Θ(n),	
* search Θ(n) 	
* insert Θ(1) to head
* deletion Θ(n)
*/
module.exports.node = data => {
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
                return null;
            }
            tempNode = tempNode.next;
            n--;
        }
        return tempNode;
    }
    const remove = node => {
        if(node == null)
            return null;
        
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
    const removeNth = n => remove(findNth(n))

    return {
        getHead: () => head,
        insert: insert,
        find: find,
        findNth: findNth,
        print: readList,
        remove: remove,
        removeNth: removeNth
    }
}

module.exports.singlyLinkedList = singlyLinkedList;