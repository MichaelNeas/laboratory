/* In a town, there are N people labelled from 1 to N.  There is a rumor that one of these people is secretly the town judge.
If the town judge exists, then:

    The town judge trusts nobody.
    Everybody (except for the town judge) trusts the town judge.
    There is exactly one person that satisfies properties 1 and 2.

You are given trust, an array of pairs trust[i] = [a, b] representing that the person labelled a trusts the person labelled b.

If the town judge exists and can be identified, return the label of the town judge.  Otherwise, return -1.
*/
class Solution {
    func findJudge(_ N: Int, _ trust: [[Int]]) -> Int {
        var count = Array(repeating: 0, count: N + 1)
        for t in trust {
            count[t[0]] -= 1
            count[t[1]] += 1
        }
        print(count)
        for i in 1..<N+1 {
            if count[i] == (N - 1) {
                return i
            }
        }
        return -1
    }
}