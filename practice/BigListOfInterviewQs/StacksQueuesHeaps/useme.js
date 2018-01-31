const stack = require('./stack')();
const queue = require('./queue');

stack.push('m');
stack.push('i');
console.log(stack.size());
stack.push('k');
console.log(stack.toString())
stack.pop();
stack.push('e');
console.log(stack.print());


queue.enqueue('m');
queue.enqueue('i');
console.log(queue.size());
queue.enqueue('k');
console.log(queue.toString())
queue.dequeue();
queue.enqueue('e');
console.log(queue.print());