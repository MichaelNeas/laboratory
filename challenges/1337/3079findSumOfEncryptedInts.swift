/// You are given an integer array nums containing positive integers. 
/// We define a function encrypt such that encrypt(x) replaces every digit in x with the largest digit in x. 
/// For example, encrypt(523) = 555 and encrypt(213) = 333.

/// Return the sum of encrypted elements.

class Solution {
    func sumOfEncryptedInt(_ nums: [Int]) -> Int {
        nums.map { num in
            let arr = String(num).compactMap { Int(String($0)) }
            return Array(repeating: arr.max()!, count: arr.count)
            .reduce(0) { $0 * 10 + $1 }
        }
        .reduce(0, +)
    }
}
