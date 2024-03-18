/// Given a string s, find any substring of length 2 which is also present in the reverse of s.
/// Return true if such a substring exists, and false otherwise.

class Solution {
    func isSubstringPresent(_ s: String) -> Bool {
        let revString = s.reversed()
        
        for i in 0..<s.count - 1 {
            let startIndex = s.index(s.startIndex, offsetBy: i)
            let endIndex = s.index(startIndex, offsetBy: 2)
            let substring = String(s[startIndex..<endIndex])
            if revString.contains(substring) {
                return true
            }
        }

        return false
    }
}
