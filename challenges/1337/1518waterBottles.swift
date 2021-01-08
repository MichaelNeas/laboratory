// Given numBottles full water bottles, you can exchange numExchange empty water bottles for one full water bottle.
// The operation of drinking a full water bottle turns it into an empty bottle.
// Return the maximum number of water bottles you can drink.
class Solution {
    func numWaterBottles(_ numBottles: Int, _ numExchange: Int) -> Int {
        var bottles = numBottles
        var total = numBottles
        
        while bottles >= numExchange {
            total += bottles / numExchange
            bottles = (bottles / numExchange) + (bottles % numExchange)
        }
        
        return total
    }
}