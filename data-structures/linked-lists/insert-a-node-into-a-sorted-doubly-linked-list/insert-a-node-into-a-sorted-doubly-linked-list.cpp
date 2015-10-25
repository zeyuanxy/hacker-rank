
/*
    Insert Node in a doubly sorted linked list 
    After each insertion, the list should be sorted
   Node is defined as
   struct Node
   {
     int data;
     Node *next;
     Node *prev
   }
*/
Node* SortedInsert(Node *head,int data)
{
    // Complete this function
   // Do not write the main method. 
    if (head == NULL || data <= head->data) {
        Node *newHead = new Node;
        newHead->data = data;
        newHead->prev = NULL;
        newHead->next = head;
        if (head)
            head->prev = newHead;
        return newHead;
    }
    Node *iter = head;
    while (iter->next && iter->next->data < data)
        iter = iter->next;
    Node *temp = iter->next;
    iter->next = new Node;
    iter->next->data = data;
    iter->next->prev = iter;
    iter->next->next = temp;
    if (temp != NULL)
        temp->prev = iter->next;
    return head;
}

