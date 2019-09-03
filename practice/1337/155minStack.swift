/*
 Design a stack that supports push, pop, top, and retrieving the minimum element in constant time.

    push(x) -- Push element x onto stack.
    pop() -- Removes the element on top of the stack.
    top() -- Get the top element.
    getMin() -- Retrieve the minimum element in the stack.
*/

class MinStack {
    var min = Int.max
    var stack: [Int]
    /** initialize your data structure here. */
    init() {
        stack = [Int]()
    }
    
    func push(_ x: Int) {
        if x <= min {
            stack.insert(min, at: 0)
            min = x
        }
        stack.insert(x, at: 0)
    }
    
    func pop() {
        if stack.removeFirst() == min {
            min = stack.removeFirst()
        }
    }
    
    func top() -> Int {
        return stack.first!
    }
    
    func getMin() -> Int {
        return min
    }
}

/**
 * Your MinStack object will be instantiated and called as such:
 * let obj = MinStack()
 * obj.push(x)
 * obj.pop()
 * let ret_3: Int = obj.top()
 * let ret_4: Int = obj.getMin()
 */