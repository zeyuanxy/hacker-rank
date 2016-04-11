#include <vector>
#include <iostream>
using namespace std;

struct Node {
    int left, right, depth;
};

void fillDepth(vector<Node>& nodes, int index) {
    Node& node = nodes[index];
    if (node.left > 0) {
        nodes[node.left].depth = node.depth + 1;
        fillDepth(nodes, node.left);
    }
    if (node.right > 0) {
        nodes[node.right].depth = node.depth + 1;
        fillDepth(nodes, node.right);
    }
}

void inorderOutput(vector<Node> &nodes, int index, int K) {
    Node& node = nodes[index];
    if (node.depth % K == 0) {
        if (node.right > 0) {
            inorderOutput(nodes, node.right, K);
        }
        cout << index + 1 << ' ';
        if (node.left > 0) {
            inorderOutput(nodes, node.left, K);
        }
        swap(node.left, node.right);
    } else {
        if (node.left > 0) {
            inorderOutput(nodes, node.left, K);
        }
        cout << index + 1 << ' ';
        if (node.right > 0) {
            inorderOutput(nodes, node.right, K);
        }
    }
}

int main() {  
    int N;
    cin >> N;
    vector<Node> nodes;
    for (int i = 0; i < N; ++i) {
        Node node;
        cin >> node.left >> node.right;
        if (node.left > 0)
            node.left--;
        if (node.right > 0)
            node.right--;
        node.depth = 0;
        nodes.push_back(node);
    }
    nodes[0].depth = 1;
    fillDepth(nodes, 0);
    int T;
    cin >> T;
    for (int i = 0; i < T; ++i) {
        int K;
        cin >> K;
        inorderOutput(nodes, 0, K);
        cout << endl;
    }
    return 0;
}
