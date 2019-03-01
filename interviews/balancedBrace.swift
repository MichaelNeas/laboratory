import Foundation

func isBalanced(input: String) -> Bool {
    var stack = Array<Character>()
    for sub in input {
        if sub == ")" {
            if stack.last == "(" {
                stack.popLast()
            } else {
                return false
            }
        } else if sub == "(" {
            stack.append(sub)
        }
    }
    return stack.count == 0
}
