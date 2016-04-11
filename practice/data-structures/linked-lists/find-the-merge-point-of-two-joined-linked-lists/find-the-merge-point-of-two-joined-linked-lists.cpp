
/*
   Find merge point of two linked lists
   Node is defined as
   struct Node
   {
       int data;
       Node* next;
   }
*/
int FindMergeNode(Node *headA, Node *headB)
{
    // Complete this function
    // Do not write the main method. 
    Node *iter = headA;
    int lenA = 0;
    while (iter) {
        ++lenA;
        iter = iter->next;
    }
    iter = headB;
    int lenB = 0;
    while (iter) {
        ++lenB;
        iter = iter->next;
    }
    while (headA && headB) {
        if (headA->data == headB->data)
            return headA->data;
        if (lenA < lenB) {
            --lenB;
            headB = headB->next;
        } else if (lenA > lenB) {
            --lenA;
            headA = headA->next;
        } else {
            --lenA, --lenB;
            headA = headA->next;
            headB = headB->next;
        }
    }
    return 0;
}

