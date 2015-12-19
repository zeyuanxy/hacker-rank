/* 
* @Author: Zeyuan Shang
* @Date:   2015-12-19 23:52:13
* @Last Modified by:   Zeyuan Shang
* @Last Modified time: 2015-12-19 23:52:21
*/


class LRUCache : public Cache {
private:
    int size;
    
    void addToHead(Node *node) {
        if (node->prev) {
            node->prev->next = node->next;
            node->next->prev = node->prev;
        }
        if (head != node) {
            node->next = head;
            node->prev = NULL;
            if (head != NULL) {
                head->prev = node;
            }
        }
    }
    
    void removeFromTail() {
        if (head == tail) {
            head = tail = NULL;
        } else {
            Node* newTail = tail->prev;
            newTail->next = NULL;
            mp.erase(tail->key);
            delete tail;
            tail = newTail;
        }
    }
    
public:
    LRUCache(int capacity) {
        cp = capacity;
        size = 0;
        head = tail = NULL;
    }
    
    void set(int key, int value) {
        Node* node = new Node(key, value);
        mp[key] = node;
        size++;
        if (size > cp) {
            removeFromTail();
            size--;
        }
        addToHead(node);
    }
    
    int get(int key) {
        if (mp.find(key) == mp.end()) {
            return -1;
        }
        addToHead(mp[key]);
        return mp[key]->value;
    }
};
