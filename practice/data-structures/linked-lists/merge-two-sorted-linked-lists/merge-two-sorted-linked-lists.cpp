
/*
  Merge two sorted lists A and B as one linked list
  Node is defined as 
  struct Node
  {
     int data;
     struct Node *next;
  }
*/
Node* MergeLists(Node *headA, Node* headB)
{
  // This is a "method-only" submission. 
  // You only need to complete this method 
    Node *guard = new Node;
    guard->next = NULL;
    Node *iter = guard;
    while (headA || headB) {
        if (headB == NULL || (headA != NULL && headA->data < headB->data)) {
            iter->next = headA;
            iter = iter->next;
            headA = headA->next;
        } else {
            iter->next = headB;
            iter = iter->next;
            headB = headB->next;
        }
    }
    return guard->next;
}

