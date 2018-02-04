//Write a function that sorts a stack (bonus: sort the stack in place without extra memory)
const stack = require('./stack');
let aStack = new stack();

let stackSort = stack => { 
    if(stack.size() > 0){
        let temp = stack.pop();
        stackSort(stack);
        sortedInsert(stack, temp);
    }
}

let sortedInsert = (stack, el) => {
    if(stack.size() === 0 || el > stack.peek())
        stack.push(el);
    else{
        let temp = stack.pop()
        sortedInsert(stack, el)
        stack.push(temp);
    }
}

let i;
for(i = 0; i < 10; i++){
    aStack.push(Math.floor(Math.random()*100));
}
console.log(aStack.print());

stackSort(aStack);

console.log(aStack.print());