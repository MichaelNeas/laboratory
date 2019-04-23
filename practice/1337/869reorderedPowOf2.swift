/// Starting with a positive integer N, we reorder the digits in any order (including the original order) such that the leading digit is not zero.
/// Return true if and only if we can do this in a way such that the resulting number is a power of 2.

class Solution {
    func reorderedPowerOf2(_ N: Int) -> Bool {
        let copy = Array(String(N))
        let power = 2
        var base = 2
        var possibleValues:[String] = []
        if N == 1 {
            return true
        }
        while String(base).count <= copy.count {
            if String(base).count == copy.count {
                possibleValues.append(String(base))
            }
            base *= power
        }
        
        for powerOfTwo in possibleValues {
            var copyOfCopy = copy
            for char in powerOfTwo.enumerated() {
                if let location = copyOfCopy.firstIndex(of: char.element) {
                    copyOfCopy.remove(at: location)
                } else {
                    break
                }
            }
            if copyOfCopy.count == 0 {
                return true
            }
        }
        return false
    }
}