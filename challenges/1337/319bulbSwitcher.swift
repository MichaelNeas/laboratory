/// There are n bulbs that are initially off. 
/// You first turn on all the bulbs. 
/// Then, you turn off every second bulb. 
/// On the third round, you toggle every third bulb (turning on if it's off or turning off if it's on).
/// For the i-th round, you toggle every i bulb. 
/// For the n-th round, you only toggle the last bulb. 
/// Find how many bulbs are on after n rounds.


/* 
A bulb ends up on iff it is switched an odd number of times.
Call them bulb 1 to bulb n. Bulb i is switched in round d if and only if d divides i.
So bulb i ends up on if and only if it has an odd number of divisors.
Divisors come in pairs, i=12 has divisors 1 and 12, 2 and 6, and 3 and 4. Except when i is a square,
36 has divisors 1 and 36, 2 and 18, 3 and 12, 4 and 9, and double divisor 6. 
So bulb i ends up on if and only if i is a square.

So just count the square numbers.

Let R = Int(Double(n).squareRoot()). That's the root of the largest square in the range [1,n]. 
And 1 is the smallest root. So you have the roots from 1 to R, that's R roots. 
*/
class Solution {
    func bulbSwitch(_ n: Int) -> Int {
        return Int(Double(n).squareRoot())
    }
}