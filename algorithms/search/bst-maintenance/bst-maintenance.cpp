#include <iostream>
#include <vector>

using namespace std;

struct TreeNode {
    TreeNode *left, *right;
    long long value, num, left_sum, right_sum;
    TreeNode(int v) {
        value = v;
        num = 1;
        left_sum = right_sum = 0;
        left = right = NULL;
    }
};

long long ans = 0, left_dis = 0, right_dis = 0;

int insert(TreeNode *root, int value, int depth) {
    ++root->num;
    if (root->value > value) {
        if (root->left == NULL) {
            root->left = new TreeNode(value);
            return depth + 1;
        } else {
            return insert(root->left, value, depth + 1);
        }
    }
    else {
        if (root->right == NULL) {
            root->right = new TreeNode(value);
            return depth + 1;
        } else {
            return insert(root->right, value, depth + 1);
        }
    }
}

void traverse(TreeNode *root, int value, int depth, int num) {
    --depth;
    if (root->value > value) {
        root->left_sum += depth + 1;
        ans += root->right_sum + num - root->left->num;
        if (depth > 0) {
            traverse(root->left, value, depth, num);
        }
    }
    else {
        root->right_sum += depth + 1;
        ans += root->left_sum + num - root->right->num;
        if (root->right->value != value) {
            traverse(root->right, value, depth, num);
        }
    }
}

int main() {
    int N, value;
    cin >> N;
    vector<int> array;
    bool flag = true;
    for (int i = 0; i < N; ++i) {
        cin >> value;
        array.push_back(value);
        if (value != i + 1) {
            flag = false;
            cout << value << "  " << i + 1 << endl;
	    break;
	}
    }
    if (!flag)
	return 0;
    if (flag) {
        for (int i = 1; i <= N; ++i) {
            ans += i * (i - 1) / 2;
            cout << ans << endl;
        }
        return 0;
    }
    TreeNode *root = new TreeNode(array[0]);
    cout << ans << endl;
    for (int i = 1; i < N; ++i) {
        int depth = insert(root, array[i], 0);
        traverse(root, array[i], depth, i + 1);
        cout << ans << endl;
    }
}