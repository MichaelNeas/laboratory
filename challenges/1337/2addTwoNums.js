/**
 * Definition for singly-linked list.
 * function ListNode(val) {
 *     this.val = val;
 *     this.next = null;
 * }
 */
/**
 * @param {ListNode} l1
 * @param {ListNode} l2
 * @return {ListNode}
 */
var addTwoNumbers = function(l1, l2) {
    let carry = 0
    let pointerToAnswer = l1
    while(l1 || l2){
        if(l1.next && l2.next){
            l1.val += l2.val + carry
        }
        
        if(l1.next === null && l2.next === null){
            l1.val += l2.val + carry
            if(l1.val > 9){
                l1.val -= 10
                l1.next = new ListNode(1)
                break
            }
        } 
        if(l1.next === null && l2.next !== null){
            l1.next = new ListNode(0)
            l1.val += l2.val + carry
        } 
        
        if(l1.next !== null && l2.next === null){
            l2.next = new ListNode(0)
            l1.val += l2.val + carry
        }

        if(l1.val > 9){
            l1.val -= 10
            carry = 1
        } else 
            carry = 0
        l1 = l1.next
        l2 = l2.next
    }
    return pointerToAnswer
};
