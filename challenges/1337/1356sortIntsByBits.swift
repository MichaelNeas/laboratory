/// Given an integer array arr. You have to sort the integers in the array in ascending order by the number of 1's 
/// in their binary representation and in case of two or more integers have the same number of 1's you have to 
/// sort them in ascending order. Return the sorted array.

class Solution {
    func sortByBits(_ arr: [Int]) -> [Int] {
        let bitDict = arr.reduce(into: [Int: Int](), {
            $0[$1] = String($1, radix: 2).filter { $0 == "1" }.count
        })
        return arr.sorted (by: { 
            bitDict[$0]! == bitDict[$1]! ? $0 < $1 : bitDict[$0]! < bitDict[$1]! 
        })
    }
}