// Given an integer number n, return the difference between the product of its digits and the sum of its digits. 
class Solution {
    //faster
    func subtractProductAndSum(_ n: Int) -> Int {
        var prod = 1
        var sum = 0
        var n = n
        while n > 0 {
            let mod = n % 10
            sum += mod
            prod *= mod
            n = n / 10
        }
        
        return prod - sum
    }

    func subtractProductAndSum(_ n: Int) -> Int {
        var prod = 1
        var sum = 0
        for dig in n.digits {
            prod *= dig
            sum += dig
        }
        return prod - sum
    }
}

extension BinaryInteger {
    var digits: [Int] {
        return String(describing: self).compactMap { Int(String($0)) }
    }
}