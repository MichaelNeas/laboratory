/** 1 hundo
 * Definition for singly-linked list.
 * function ListNode(val) {
 *     this.val = val;
 *     this.next = null;
 * }
 */
/**
 * @param {ListNode} head
 * @return {ListNode}
 */
var middleNode = function(head) {
    let mid = head
    
    let ticker = 1
    while(head.next != null){
        if(ticker % 2) mid = mid.next
        head = head.next
        ticker++
    }
    return mid
};