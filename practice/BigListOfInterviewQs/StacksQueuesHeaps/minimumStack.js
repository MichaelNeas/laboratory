const Stack = require('./stack');

const fullStack = new Stack();
const supportingStack = new Stack();

fullStack.pushMaintainMin = val => {
    fullStack.push(val);
    if(val <= supportingStack.peek() || supportingStack.size() === 0){
        supportingStack.push(val);
    }
}

fullStack.popMaintainMin = () => {
    let popped = fullStack.pop();
    if(popped === supportingStack.peek()){
        supportingStack.pop();
    }
}

supportingStack.min = () => supportingStack.peek();

fullStack.pushMaintainMin(5);
fullStack.pushMaintainMin(2);
fullStack.pushMaintainMin(1);
fullStack.pushMaintainMin(1);
fullStack.pushMaintainMin(4);
fullStack.popMaintainMin();
fullStack.popMaintainMin();
fullStack.popMaintainMin();
fullStack.popMaintainMin();
fullStack.pushMaintainMin(3);
fullStack.pushMaintainMin(10);
fullStack.pushMaintainMin(9);
fullStack.pushMaintainMin(4);
fullStack.pushMaintainMin(2);
fullStack.pushMaintainMin(190);
fullStack.pushMaintainMin(8);
console.log(`stack contains ${fullStack.print()}`);
console.log(`min element in stack is: ${supportingStack.min()}`);