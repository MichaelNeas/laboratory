// Say you have an array for which the ith element is the price of a given stock on day i.

// If you were only permitted to complete at most one transaction 
// (i.e., buy one and sell one share of the stock), design an algorithm to find the maximum profit.

// Note that you cannot sell a stock before you buy one.

class Solution {
    func maxProfit(_ prices: [Int]) -> Int {
        guard prices.count > 1 else { return 0 }
        var max = 0
        var min = Int.max
        for i in 0..<prices.count {
            if prices[i] < min {
                min = prices[i]
            }
            if prices[i] - min > max {
                max = prices[i] - min
            }
        }
        return max
    }
}