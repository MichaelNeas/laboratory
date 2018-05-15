// https://leetcode.com/problems/reverse-integer/description/
class Solution {
    func reverse(_ x: Int) -> Int {
        let multiplier = 10
        //var reversedStringConvertedInteger = 
        //print(reversedStringConvertedInteger)
        // for character in stringConvertedInteger.count...0 {
        //     print(character)
        // }
        
        var signed: Int32 = 1
        if x < 0 {
            signed = -1
        }

        if let d = Int32(String(String(abs(x)).reversed())) {
            return Int(d * signed)
        }
        return 0
    }
}
