// Given a list of numbers and a number k, 
// return whether any two numbers from the list add up to k.
// For example, given [10, 15, 3, 7] and k of 17, 
// return true since 10 + 7 is 17.
// Bonus: Can you do this in one pass?

func twoSum(input: [Int], k: Int) -> Bool {
    var possibleSet = Set<Int>()
    for i in input {
        if possibleSet.contains(k - i) {
            return true
        } else {
            possibleSet.insert(i)
        }
    }
    return false
}

assert(twoSum(input: [10, 15, 3, 7], k: 17) == true)