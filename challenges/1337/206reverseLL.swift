/**
 * Reverse a singly linked list.
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
    func reverseList(_ head: ListNode?) -> ListNode? {
        guard var curr = head else { return nil }
        var temp: ListNode?
        while curr.next != nil {
            var next = curr.next!
            curr.next = temp
            temp = curr
            curr = next 
        }
        curr.next = temp
        return curr
    }
}