
class MyQueue {
    var stack: Stack
    var helperStack: Stack
    
    /** Initialize your data structure here. */
    init() {
        stack = Stack()
        helperStack = Stack()
    }
    
    /** Push element x to the back of queue. */
    func push(_ x: Int) {
        while !helperStack.isEmpty {
            stack.push(helperStack.pop())
        }
        stack.push(x)
    }
    
    /** Removes the element from in front of queue and returns that element. */
    func pop() -> Int {
        if !helperStack.isEmpty {
            return helperStack.pop()
        } else {
            while !stack.isEmpty {
                helperStack.push(stack.pop())
            }
        }
        
        return helperStack.pop()
    }
    
    /** Get the front element. */
    func peek() -> Int {
        if !helperStack.isEmpty {
            return helperStack.peek
        } else {
            while !stack.isEmpty {
                helperStack.push(stack.pop())
            }
        }
        
        return helperStack.peek
    }
    
    /** Returns whether the queue is empty. */
    func empty() -> Bool {
        return helperStack.isEmpty && stack.isEmpty
    }
}

class Stack {
    var structure = [Int]()
    
    func push(_ x: Int) {
        structure.append(x)
    }
    
    func pop() -> Int {
        return structure.removeLast()
    }
    
    var isEmpty: Bool {
        return structure.isEmpty
    }
    
    var peek: Int {
        return structure.last!
    }
}

/**
 * Your MyQueue object will be instantiated and called as such:
 * let obj = MyQueue()
 * obj.push(x)
 * let ret_2: Int = obj.pop()
 * let ret_3: Int = obj.peek()
 * let ret_4: Bool = obj.empty()
 */