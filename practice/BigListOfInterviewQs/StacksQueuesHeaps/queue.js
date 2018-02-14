//Implement a queue with queue and dequeue functions
//http://en.cppreference.com/w/cpp/container/queue
//bonkers clear state, its all mutation pasodjfiohansf

module.exports = function(){
    const state = [];
    return {
        clear: () => state.length = 0,
        clone: () => [...state],
        contains: (val) => state.includes(val),
        empty: () => state.length === 0,
        equals: (val) => state.equals(val),
        front: () => state[0],
        back: () => state[state.length - 1],
        dequeue: () => state.splice(0,1)[0],
        print: () => state,
        enqueue: (val) => state.push(val),
        size: () => state.length,
        toString: () => state.toString()
    }
}