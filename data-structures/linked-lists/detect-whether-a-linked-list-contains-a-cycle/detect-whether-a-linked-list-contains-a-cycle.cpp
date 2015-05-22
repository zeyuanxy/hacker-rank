
/*
  Detect loop in a linked list 
  List could be empty also
  Node is defined as 
  struct Node
  {
     int data;
     struct Node *next;
  }
*/
int HasCycle(Node* head)
{
   // Complete this function
   // Do not write the main method
    Node *fast = head, *slow = head;
    while (fast && slow) {
        fast = fast->next;
        if (fast)
            fast = fast->next;
        else
            return 0;
        slow = slow->next;
        if (fast != NULL && fast == slow)
            return 1;
    }
    return 0;
}

