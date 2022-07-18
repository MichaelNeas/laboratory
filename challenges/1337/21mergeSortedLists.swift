// You are given the heads of two sorted linked lists list1 and list2.
// Merge the two lists in a one sorted list. 
// The list should be made by splicing together the nodes of the first two lists.
// Return the head of the merged linked list.

/**
 * Definition for singly-linked list.
 * public class ListNode {
 *     public var val: Int
 *     public var next: ListNode?
 *     public init() { self.val = 0; self.next = nil; }
 *     public init(_ val: Int) { self.val = val; self.next = nil; }
 *     public init(_ val: Int, _ next: ListNode?) { self.val = val; self.next = next; }
 * }
 */
class Solution {
    func mergeTwoListsRecursive(_ list1: ListNode?, _ list2: ListNode?) -> ListNode? {
        guard let list1 = list1 else { return list2 }
        guard let list2 = list2 else { return list1 }
        if list1.val < list2.val {
            list1.next = mergeTwoLists(list1.next, list2)
            return list1
        } else {
            list2.next = mergeTwoLists(list1, list2.next)
            return list2
        }
    }
    
    func mergeTwoListsIterative(_ list1: ListNode?, _ list2: ListNode?) -> ListNode? {
        var list1 = list1
        var list2 = list2
        var sorted = ListNode()
        let head = sorted
        
        while list1 != nil || list2 != nil {
            if list1 == nil {
                sorted.next = list2
                return head.next
            } else if list2 == nil {
                sorted.next = list1
                return head.next
            } else {
                if list1!.val > list2!.val {
                    sorted.next = ListNode(list2!.val)
                    list2 = list2?.next
                } else {
                    sorted.next = ListNode(list1!.val)
                    list1 = list1?.next
                }
                sorted = sorted.next!
            }
        }
        
        return head.next
    }
}