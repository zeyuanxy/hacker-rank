/* 
* @Author: Zeyuan Shang
* @Date:   2015-12-02 17:10:35
* @Last Modified by:   Zeyuan Shang
* @Last Modified time: 2015-12-02 17:10:50
*/

#include <cmath>
#include <cstdio>
#include <vector>
#include <iostream>
#include <algorithm>

using namespace std;

class TrieNode {
public:
    TrieNode() : children(26, NULL), isWord(false) {
    }
    vector<TrieNode*> children;
    bool isWord;
};

class Trie {
public:
    Trie() {
        root = new TrieNode();
    }

    void insert(string word) {
        TrieNode* p = root;
        for (auto c : word) {
            if (!p->children[c - 'a']) {
                p->children[c - 'a'] = new TrieNode();
            }
            p = p->children[c - 'a'];
        }
        p->isWord = true;
    }

    bool isPrefix(string prefix) {
        TrieNode* p = root;
        for (auto c : prefix) {
            if (!p->children[c - 'a']) {
                return false;
            } else if (p->children[c - 'a']->isWord) {
                return true;
            }
            p = p->children[c - 'a'];
        }
        return true;
    }

private:
    TrieNode* root;
};

int main() {
    Trie* trie = new Trie();
    int n;
    cin >> n;
    for (int i = 0; i < n; ++i) {
        string word;
        cin >> word;
        if (trie->isPrefix(word)) {
            cout << "BAD SET" << endl << word << endl;
            return 0;
        }
        trie->insert(word);
    }
    cout << "GOOD SET" << endl;
    return 0;
}
