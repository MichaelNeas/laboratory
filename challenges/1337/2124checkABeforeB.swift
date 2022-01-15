// Given a string s consisting of only the characters 'a' and 'b', return true if every 'a' appears before every 'b' in the string. Otherwise, return false.

class Solution {
    func checkString(_ s: String) -> Bool {
        // var prevB = false
        // for letter in s {
        //     if letter == "a" {
        //         if prevB {
        //             return false
        //         }
        //     } else {
        //         prevB = true
        //     }
        // }
        // return true
        !s.contains("ba")
    }
}