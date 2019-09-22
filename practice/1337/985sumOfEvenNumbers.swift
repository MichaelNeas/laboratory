///  We have an array A of integers, and an array queries of queries.
/// For the i-th query val = queries[i][0], index = queries[i][1], we add val to A[index].  Then, the answer to the i-th query is the sum of the even values of A.
/// (Here, the given index = queries[i][1] is a 0-based index, and each query permanently modifies the array A.)
/// Return the answer to all queries.  Your answer array should have answer[i] as the answer to the i-th query.

class Solution {
    func sumEvenAfterQueries(_ A: [Int], _ queries: [[Int]]) -> [Int] {
        var A = A
        var sum = A.reduce(0, { $0 + ($1 % 2 == 0 ? $1 : 0) })
        var sol = [Int]()
        queries.forEach { query in
            sum -= A[query[1]] % 2 == 0 ? A[query[1]] : 0
            A[query[1]] += query[0]
            sum += A[query[1]] % 2 == 0 ? A[query[1]] : 0
            sol.append(sum)
        }
        return sol
    }
}