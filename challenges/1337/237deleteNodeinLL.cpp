/**
 * Definition for singly-linked list.
 * Write a function to delete a node (except the tail) in a singly linked list, given only access to that node.
 *  
 * */
struct ListNode {
	int val;
	ListNode *next;
	ListNode(int x) : val(x), next(NULL) {}
};

class Solution {
public:
    void deleteNode(ListNode* node) {
        node->val=node->next->val;
        node->next=node->next->next;
    }
};