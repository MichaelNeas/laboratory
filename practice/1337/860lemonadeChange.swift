/// At a lemonade stand, each lemonade costs $5. 
/// Customers are standing in a queue to buy from you, and order one at a time (in the order specified by bills).
/// Each customer will only buy one lemonade and pay with either a $5, $10, or $20 bill.  You must provide the 
/// correct change to each customer, so that the net transaction is that the customer pays $5.
/// Note that you don't have any change in hand at first.
/// Return true if and only if you can provide every customer with correct change.

class Solution {
    func lemonadeChange(_ bills: [Int]) -> Bool {
        var fives = 0
        var tens = 0 
        var twenties = 0
        
        for bill in bills {
            if bill == 5 { fives += 1 }
            else if bill == 10 { fives -= 1; tens += 1}
            else if tens > 0 { fives -= 1; tens -= 1 }
            else { fives -= 3 }
            if fives < 0 { return false }
        }
        return true
    }
}