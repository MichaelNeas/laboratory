/// Given a positive integer num consisting only of digits 6 and 9.
/// Return the maximum number you can get by changing at most one digit (6 becomes 9, and 9 becomes 6).
class Solution {
    func maximum69Number (_ num: Int) -> Int {
        var sol = ""
        var str = String(num)
        for val in str  {
            str.removeFirst()
            sol.append("9")
            if val == "6" { break }
        }
        sol += str
        return Int(sol)!
    }
}