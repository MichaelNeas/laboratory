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

func akIsBalanced(str: String) -> Bool {
    var open = 0
    var closed = 0
    for char in str {
        if char == "(" {
            open += 1
        } else if sub == ")" {
            closed += 1
            guard closed <= open else { return false }
        }
    }
    return open == closed
}
