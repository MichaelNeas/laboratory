// You are given a string date representing a Gregorian calendar date in the yyyy-mm-dd format.
// date can be written in its binary representation obtained by converting year, month, and day to their binary representations without any leading zeroes and writing them down in year-month-day format.
// Return the binary representation of date.

class Solution {
    func convertDateToBinary(_ date: String) -> String {
        let parts = date.components(separatedBy: "-").compactMap(Int.init)
        return "\(String(parts[0], radix: 2))-\(String(parts[1], radix: 2))-\(String(parts[2], radix: 2))"
    }
}