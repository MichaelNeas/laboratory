// Given the array nums consisting of 2n elements in the form [x1,x2,...,xn,y1,y2,...,yn].
// Return the array in the form [x1,y1,x2,y2,...,xn,yn].

class Solution {
    func shuffle(_ nums: [Int], _ n: Int) -> [Int] {
        var sol = [Int]()
        for i in 0..<n {
            sol.append(nums[i])
            sol.append(nums[n+i])
        }
        return sol
    }
}