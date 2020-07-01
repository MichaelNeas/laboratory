// Given an array of unique integers salary where salary[i] is the salary of the employee i.
// Return the average salary of employees excluding the minimum and maximum salary.

class Solution {
    func average(_ salary: [Int]) -> Double {
        return Double(salary.sorted().dropFirst().dropLast().reduce(0, +)) / Double(salary.count - 2)
    }

	func average(_ salary: [Int]) -> Double {
        var max = Int.min
        var min = Int.max
        var sum = 0
        for sal in salary {
            if max < sal {
                max = sal
            }
            
            if min > sal {
                min = sal
            }
            
            sum += sal
        }
        
        sum -= (min + max)
        
        return Double(sum) / Double(salary.count - 2)
    }
}