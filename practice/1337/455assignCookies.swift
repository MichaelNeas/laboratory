/// Assume you are an awesome parent and want to give your children some cookies. But, you should give each child at most one cookie. 
/// Each child i has a greed factor gi, which is the minimum size of a cookie that the child will be content with; and each cookie j has a size sj. 
/// If sj >= gi, we can assign the cookie j to the child i, and the child i will be content. Your goal is to maximize the number of your content children and output the maximum number.

/// Note:
/// You may assume the greed factor is always positive.
/// You cannot assign more than one cookie to one child. 

class Solution {
    func findContentChildren(_ g: [Int], _ s: [Int]) -> Int {
        var totalSortedCookies = s.sorted()
        let sortedGreedyChildren = g.sorted()
        var cookieCounter = 0
        var childCounter = 0
        while cookieCounter < totalSortedCookies.count && childCounter < sortedGreedyChildren.count {
            if totalSortedCookies[cookieCounter] >= sortedGreedyChildren[childCounter] {
                childCounter += 1
            }
            cookieCounter += 1
            
        }
        return childCounter
    }
}