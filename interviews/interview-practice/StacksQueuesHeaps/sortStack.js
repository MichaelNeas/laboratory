//Write a function that sorts a stack (bonus: sort the stack in place without extra memory)
const stack = require('./stack');
let aStack = new stack();

let stackSort = stack => { 
    if(stack.size() > 0){
        let temp = stack.pop();
        //hold temp in the call stack real quick
        stackSort(stack);
        //sort on the elements in the call stack
        sortedInsert(stack, temp);
    }
}

let sortedInsert = (stack, val) => {
    if(stack.size() === 0 || val > stack.peek()){
        console.log(`Pushing ${val} on to the stack`);
        stack.push(val);
    }else{
        let temp = stack.pop();
        console.log(`Popping ${temp} off of the stack`);
        sortedInsert(stack, val);
        stack.push(temp);
        console.log(`Pushing ${temp} on to the stack`);
    }
}

let i;
for(i = 0; i < 10; i++){
    aStack.push(Math.floor(Math.random()*100));
}
console.log(aStack.print());

stackSort(aStack);

console.log(aStack.print());