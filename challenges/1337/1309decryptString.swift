/// Given a string s formed by digits ('0' - '9') and '#' . We want to map s to English lowercase characters as follows:
///   Characters ('a' to 'i') are represented by ('1' to '9') respectively.
///   Characters ('j' to 'z') are represented by ('10#' to '26#') respectively. 
/// Return the string formed after mapping.
/// It's guaranteed that a unique mapping will always exist.

class Solution {
    func freqAlphabets(_ s: String) -> String {
        var sol = ""
        var i = 0
        var s = s.map( { String($0) })
        let a = Int(Unicode.Scalar("a").value) - 1
        while i<s.count {
            if i + 2 < s.count, s[i+2] == "#" {
                let temp = s[i] + s[i+1]
                sol += String(format: "%c", a + Int(temp)!) as String
                i += 3
            } else {
                sol += String(format: "%c", a + Int(s[i])!) as String
                i += 1
            }
        }
        return sol
    }
}