/// You're given strings J representing the types of stones that are jewels, and S representing the stones you have.  
/// Each character in S is a type of stone you have.  You want to know how many of the stones you have are also jewels.
/// The letters in J are guaranteed distinct, and all characters in J and S are letters. Letters are case sensitive, 
/// so "a" is considered a different type of stone from "A".
/// Formula is [mapping ops] + [lookups]
/// Best case: 1 + 1 = 2
/// Worst case: 50 + 50 = 100
/// So we can tight bound at T(1)

class Solution {
    func numJewelsInStones(_ J: String, _ S: String) -> Int {
        let jewels = Set(Array(J))
        return Array(S).reduce(0, { jewels.contains($1) ? $0+1 : $0 })
    }
}