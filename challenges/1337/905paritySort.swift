/// Given an array A of non-negative integers, return an array consisting of all the even elements of A, followed by all the odd elements of A.

class Solution {
    func sortArrayByParity(_ A: [Int]) -> [Int] {
        var a = A
        var evensPlace = 0
        var iterationPlace = 0
        var tmp = 0
        while iterationPlace < a.count {
            if a[iterationPlace] % 2 == 0 {
                tmp = a[evensPlace]
                a[evensPlace] = a[iterationPlace]
                evensPlace += 1
                a[iterationPlace] = tmp
            }
            iterationPlace += 1
        }
        return a
    }
}