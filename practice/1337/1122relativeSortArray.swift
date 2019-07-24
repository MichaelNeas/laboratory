/// Given two arrays arr1 and arr2, the elements of arr2 are distinct, and all elements in arr2 are also in arr1.
/// Sort the elements of arr1 such that the relative ordering of items in arr1 are the same as in arr2.  
/// Elements that don't appear in arr2 should be placed at the end of arr1 in ascending order.

class Solution {
    func relativeSortArray(_ arr1: [Int], _ arr2: [Int]) -> [Int] {
        var sol: [Int] = []
        var arr1 = arr1
        for el2 in arr2 {
            var i = 0
            while i < arr1.count {
                if el2 == arr1[i] {
                    sol.append(arr1.remove(at: i))   
                } else { 
                    i += 1
                }
            }
        }
        return sol + arr1.sorted()
    }
}