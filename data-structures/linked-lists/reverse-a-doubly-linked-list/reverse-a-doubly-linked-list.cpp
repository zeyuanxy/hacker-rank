
/*
   Reverse a doubly linked list, input list may also be empty
   Node is defined as
   struct Node
   {
     int data;
     Node *next;
     Node *prev;
   }
*/
Node* Reverse(Node* head)
{
    // Complete this function
    // Do not write the main method. 
    if (head == NULL || head->next == NULL)
        return head;
    Node *iter = head->next;
    head->next = NULL;
    head->prev = iter;
    while (iter) {
        Node *temp = iter->next;
        iter->next = head;
        iter->prev = temp;
        head = iter;
        iter = temp;
    }
    return head;
}

