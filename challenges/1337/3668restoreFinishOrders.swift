// You are given an integer array order of length n and an integer array friends
// order contains every integer from 1 to n exactly once, representing the IDs of the participants of a race in their finishing order.
// friends contains the IDs of your friends in the race sorted in strictly increasing order. Each ID in friends is guaranteed to appear in the order array.
// Return an array containing your friends' IDs in their finishing order.

 class Solution { 
    func recoverOrder(_ order: [Int], _ friends: [Int]) -> [Int] {
        var solution = [Int]()
        for val in order {
            if friends.contains(val) && !solution.contains(val) {
                solution.append(val)
            } 
        }
        return solution

    }
    // func recoverOrder(_ order: [Int], _ friends: [Int]) -> [Int] {
    //     let orderDict = order.enumerated().reduce(into: [Int:Int](), { acc, curr in
    //         acc[curr.1] = curr.0
    //     })
    //     return friends.sorted(by: { orderDict[$0]! < orderDict[$1]! })

    // }
}