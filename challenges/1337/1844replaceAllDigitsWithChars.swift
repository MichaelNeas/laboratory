// You are given a 0-indexed string s that has lowercase English letters in its even indices and digits in its odd indices.
// There is a function shift(c, x), where c is a character and x is a digit, that returns the xth character after c.
// For example, shift('a', 5) = 'f' and shift('x', 0) = 'x'.
// For every odd index i, you want to replace the digit s[i] with shift(s[i-1], s[i]).
// Return s after replacing all digits. It is guaranteed that shift(s[i-1], s[i]) will never exceed 'z'.

class Solution {
    func replaceDigits(_ s: String) -> String {
	    s.unicodeScalars.reduce(into: (String(), UInt32(0)), { acc, curr in
		    acc.0 += String(UnicodeScalar(curr.value < 97 ? UInt32(String((UnicodeScalar(curr.value)!)))! + acc.1 : curr.value)!)
		    acc.1 = curr.value < 97 ? 0 : curr.value
	    }).0
    }
}