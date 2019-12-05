/// Given an array of integers and an integer k, find out whether there are two distinct indices i and j 
/// in the array such that nums[i] = nums[j] and the absolute difference between i and j is at most k.

class Solution {
    func containsNearbyDuplicate(_ nums: [Int], _ k: Int) -> Bool {
        var numSet = [Int:Set<Int>]()
        for (i, num) in nums.enumerated() {
            if numSet[num] != nil{
                for foundIndex in numSet[num]! {
                    if abs(foundIndex - i) <= k {
                        return true
                    } else {
                        numSet[num]?.insert(i)
                    }
                }
            } else {
                numSet[num] = Set([i])
            }
        }
        return false
    }

    func containsNearbyDuplicateAK (_ nums: [Int], _ k: Int) -> Bool {
        var seenNumbers = [Int : Int]()
        for i in 0..<nums.count {
            let num = nums[i]
            if let j = seenNumbers[num] {
                guard i - j > k else { return true }
            }
            seenNumbers[num] = i
        }
        return false   
    }

    func containsNearbyDuplicateBest(_ nums: [Int], _ k: Int) -> Bool {
        var set = Set<Int>()
        
        for i in 0..<nums.count {
            if i > k {
                set.remove(nums[i - k - 1])
            }
            if !set.insert(nums[i]).inserted {
                return true
            }
        }
        
        return false
    }
}