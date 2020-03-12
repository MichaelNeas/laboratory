// Given an array of integers, return a new array such that each element at index i of the 
// new array is the product of all the numbers in the original array except the one at i.
// For example, if our input was [1, 2, 3, 4, 5], the expected output would be [120, 60, 40, 30, 24]. 
// If our input was [3, 2, 1], the expected output would be [2, 3, 6].
// Follow-up: what if you can't use division?

func bruteForce(input: [Int]) -> [Int] {
    var sol = [Int]()
    for i in 0..<input.count {
        var temp = 1
        for j in 0..<input.count {
            if i != j {
                temp *= input[j]
            }
        }
        sol.append(temp)
    }
    return sol
}

assert(bruteForce(input: [1, 2, 3, 4, 5]) == [120, 60, 40, 30, 24])

func division(input: [Int]) -> [Int] {
    let total = input.reduce(1, *)
    return input.map { total / $0 }
}

assert(division(input: [1, 2, 3, 4, 5]) == [120, 60, 40, 30, 24])
