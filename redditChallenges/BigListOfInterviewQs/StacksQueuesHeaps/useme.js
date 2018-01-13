const stack = require('./stack');


stack.push('m');
stack.push('i');
console.log(stack.size());
stack.push('k');
console.log(stack.toString())
stack.pop();
stack.push('e');
console.log(stack.print());
