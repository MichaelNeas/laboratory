// HARD: Implement a queue using 2 stacks
const assert = require('assert');
const stack = require('./stack');

function fakeQueue(){
    const aStack = new stack();
    const bStack = new stack();

    const enqueue = node => {
        bStack.push(node);   
    }

    const dequeue = () => {
        while(bStack.size() > 0){
            aStack.push(bStack.pop());
        }
        let res = aStack.pop();
        while(aStack.size() > 0){
            bStack.push(aStack.pop());
        }
        return res;
    }
    return{
        enqueue: enqueue,
        dequeue: dequeue
    }
}

const Queue = require('./queue');
const realQueue = new Queue();
const superAwesomeQueue = new fakeQueue();

let i;
for(i = 0; i< 10; i++){
    superAwesomeQueue.enqueue(i);
    realQueue.enqueue(i);
}



for(i = 0; i< 10; i++){
    let a = superAwesomeQueue.dequeue();
    let b = realQueue.dequeue()
    //console.log(a, b);
    assert.equal(a, b, `Failed assertion at ${i}`);
}
