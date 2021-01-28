// Given the array prices where prices[i] is the price of the ith item in a shop. There is a special discount for items in the shop, if you buy the ith item, then you will receive a discount equivalent to prices[j] where j is the minimum index such that j > i and prices[j] <= prices[i], otherwise, you will not receive any discount at all.
// Return an array where the ith element is the final price you will pay for the ith item of the shop considering the special discount.

class Solution {
    func finalPrices(_ prices: [Int]) -> [Int] {
        prices.enumerated().map({ (index, price) in
            var nextFoundIndex = index + 1
            while nextFoundIndex < prices.count {
                if price >= prices[nextFoundIndex] && index < nextFoundIndex {
                    return price - prices[nextFoundIndex]
                } else {
                    nextFoundIndex += 1
                }
            }
            return price
        })
    }
}