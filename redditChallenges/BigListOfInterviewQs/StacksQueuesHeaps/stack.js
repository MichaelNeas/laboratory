//Implement a stack with push and pop functions
//https://msdn.microsoft.com/en-us/library/system.collections.stack_methods(v=vs.110).aspx
const state = [];

const stack = {
    clear: () => state = [],
    clone: () => [...state],
    contains: (val) => state.includes(val),
    equals: (val) => state.equals(val),
    peek: () => state[state.length-1],
    pop: () => state.pop(),
    print: () => state,
    push: (val) => state.push(val),
    size: () => state.length,
    toString: () => state.toString()
}

module.exports = stack;