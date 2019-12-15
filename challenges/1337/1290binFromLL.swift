// Given head which is a reference node to a singly-linked list. 
// The value of each node in the linked list is either 0 or 1. 
// The linked list holds the binary representation of a number.
// Return the decimal value of the number in the linked list.
/**
 * Definition for singly-linked list.
 * public class ListNode {
 *     public var val: Int
 *     public var next: ListNode?
 *     public init(_ val: Int) {
 *         self.val = val
 *         self.next = nil
 *     }
 * }
 */
class Solution {
    func getDecimalValue(_ head: ListNode?) -> Int {
        var head = head
        var answer = 0
        while head != nil {
            // shift adds a 0 to the right
            // bitwise OR will make that 0 a 1 if the head is 1
            answer = (answer << 1) | head!.val
            head = head!.next
        }
        return answer
    }
}