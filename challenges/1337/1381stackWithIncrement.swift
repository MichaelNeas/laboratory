// Design a stack which supports the following operations.
// Implement the CustomStack class:
//     CustomStack(int maxSize) Initializes the object with maxSize which is the maximum number of elements in the stack or do nothing if the stack reached the maxSize.
//     void push(int x) Adds x to the top of the stack if the stack hasn't reached the maxSize.
//     int pop() Pops and returns the top of stack or -1 if the stack is empty.
//     void inc(int k, int val) Increments the bottom k elements of the stack by val. If there are less than k elements in the stack, just increment all the elements in the stack.

class CustomStack {
    var stack = [Int]()
    var maxSize: Int
    
    init(_ maxSize: Int) {
        self.maxSize = maxSize    
    }
    
    func push(_ x: Int) {
        guard stack.count < maxSize else { return }
        stack.append(x)
    }
    
    func pop() -> Int {
        stack.isEmpty ? -1 : stack.removeLast()
    }
    
    func increment(_ k: Int, _ val: Int) {
        for i in 0..<min(k,stack.count) {
            stack[i] += val
        }
    }
}

/**
 * Your CustomStack object will be instantiated and called as such:
 * let obj = CustomStack(maxSize)
 * obj.push(x)
 * let ret_2: Int = obj.pop()
 * obj.increment(k, val)
 */