/// Given two strings S and T, return if they are equal when both are typed into empty text editors. # means a backspace character.
class Solution {
    func backspaceCompare(_ S: String, _ T: String) -> Bool {
        let back = Character("#")
        func stackWork(list: String) -> [Character] {
            var stack = [Character]()
            for letter in list {
                if letter == back {
                    if !stack.isEmpty { stack.removeLast() }
                } else {
                    stack.append(letter)
                }
            }
            return stack
        }
        return stackWork(list: S) == stackWork(list: T)
    }
}