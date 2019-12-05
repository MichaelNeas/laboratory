	this.insert=function(head,data){
        let node = new Node(data);
        if(head === null){
            return node;
        }else if(head.next === null){
            head.next = node;
        }else{
            this.insert(head.next, data);
        }
        return head;
    }