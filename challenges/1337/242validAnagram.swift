/// Given two strings s and t , write a function to determine if t is an anagram of s.
class Solution {
    // 82%
    func isAnagram(_ s: String, _ t: String) -> Bool {
        guard s.count == t.count else { return false }
        var sDict = s.reduce(into: [Character:Int](), { $0[$1, default: 0] += 1 })
        var tDict = t.reduce(into: [Character:Int](), { $0[$1, default: 0] += 1 })
        for (key, value) in tDict {
            guard value == sDict[key] else {return false}
        }
        return true
    }

    // 40%
    func isSlowerAnagram(_ s: String, _ t: String) -> Bool {
        guard s.count == t.count else { return false }
        var sDict = s.reduce(into: [Character:Int](), { $0[$1, default: 0] += 1 })
        for tChar in t {
            guard sDict[tChar] != nil && sDict[tChar]! > 0 else { return false }
            sDict[tChar]! -= 1
        }
        return true
    }
}