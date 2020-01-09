/// A student could be rewarded if his attendance record doesn't contain more than one 'A' (absent) or more than two continuous 'L' (late). 
class Solution {
    func checkRecord(_ s: String) -> Bool {
        let pattern = "A.*A|LLL"
        let regex = try! NSRegularExpression(pattern: pattern)
        return regex.firstMatch(in: s, range: NSRange(location: 0, length: s.count)) == nil
    }

    func checkRecord(_ s: String) -> Bool {
        var foundA = false
        var lCount = 0
        for char in s {
            if char == "A" {
                if foundA {
                    return false
                }
                foundA = true
            }
            
            if char == "L" {
                lCount += 1
                if lCount > 2 {
                    return false
                }
            } else {
                lCount = 0
            }
        }
        return true
    }

    func checkRecord(_ s: String) -> Bool {
        return s.firstIndex(of: "A") == s.lastIndex(of: "A") && !s.contains("LLL")
    }
}