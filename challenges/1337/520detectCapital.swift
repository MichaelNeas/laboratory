class Solution {
    func detectCapitalUse(_ word: String) -> Bool {
        return word.isProper()
    }
}

extension Character {
    func isUppercased() -> Bool {
        let stringVal = String(self)
        return stringVal.uppercased() == stringVal
    }
}

extension String {
    func isProper() -> Bool {
        guard let first = self.first else { return false }
        let remaining = self.dropFirst()
        let remainingIsLower = remaining.lowercased() == remaining
        let remainingIsUpper = remaining.uppercased() == remaining
        return first.isUppercased() ? remainingIsUpper || remainingIsLower : remainingIsLower
    }
}