// Given an array target and an integer n. In each iteration, you will read a number from  list = {1,2,3..., n}.

// Build the target array using the following operations:

//     Push: Read a new element from the beginning list, and push it in the array.
//     Pop: delete the last element of the array.
//     If the target array is already built, stop reading more elements.

// You are guaranteed that the target array is strictly increasing, only containing numbers between 1 to n inclusive.

// Return the operations to build the target array.

// You are guaranteed that the answer is unique.

class Solution {
    func buildArray(_ target: [Int], _ n: Int) -> [String] {
        var i = 1
        var stack = [String]()
        var target = target
        repeat {
            if let targ = target.first {
                stack.append("Push")
                if i == targ {
                    target.removeFirst()
                } else if i < targ {
                    stack.append("Pop")
                }
            }
            i += 1
        } while i <= n && !target.isEmpty
        
        return stack
    }
}