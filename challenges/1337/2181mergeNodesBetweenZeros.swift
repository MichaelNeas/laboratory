/**
 * Definition for singly-linked list.
 * public class ListNode {
 *     public var val: Int
 *     public var next: ListNode?
 *     public init() { self.val = 0; self.next = nil; }
 *     public init(_ val: Int) { self.val = val; self.next = nil; }
 *     public init(_ val: Int, _ next: ListNode?) { self.val = val; self.next = next; }
 * }
 * You are given the head of a linked list, which contains a series of integers separated by 0's. The beginning and end of the linked list will have Node.val == 0.
 * For every two consecutive 0's, merge all the nodes lying in between them into a single node whose value is the sum of all the merged nodes. The modified list should not contain any 0's.
 * Return the head of the modified linked list.
 */
 
class Solution {
    func mergeNodes(_ head: ListNode?) -> ListNode? {
        
        var solution: ListNode? = ListNode(0)
        let ret = solution
        var curr = head
        
        while curr?.next != nil {
            var counter = 0
            curr = curr!.next
            
            while curr!.val != 0 {
                counter += curr!.val
                curr = curr!.next
            }
            
            let node = ListNode(counter)
            solution?.next = node
            solution = solution?.next
        }
        
        return ret?.next
    }
}