
/*
  Remove all duplicate elements from a sorted linked list
  Node is defined as 
  struct Node
  {
     int data;
     struct Node *next;
  }
*/
Node* RemoveDuplicates(Node *head)
{
  // This is a "method-only" submission. 
  // You only need to complete this method. 
    Node *iter = head;
    while (iter->next) {
        if (iter->next->data == iter->data) {
            iter->next = iter->next->next;
        } else {
            iter = iter->next;
        }
    }
    return head;
}

