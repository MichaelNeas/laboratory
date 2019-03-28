/// The Fibonacci numbers, commonly denoted F(n) form a sequence, called the Fibonacci sequence

class Solution {
    func fib(_ N: Int) -> Int {
        return N == 0 ? 0 : N == 1 ? 1 : fib(N - 1) + fib(N - 2)
    }

    var memo = [0, 1]
    func memoFib(_ N: Int) -> Int {
        if N < memo.count { return memo[N] }
        memo.append(fib(N - 1) + fib(N - 2))
        return memo[N]
    }
}