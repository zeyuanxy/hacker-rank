#include <iostream>
#include <vector>
#include <cstring>

using namespace std;

int N = 0;

int *bit = NULL;

void add(int x, int v) {
    while (x <= N) {
        bit[x] += v;
        x += (x & -x);
    }
}

int ask(int x) {
    int ret = 0;
    while (x) {
        ret += bit[x];
        x -= (x & -x);
    }
    return ret;
}

int main() {
    cin >> N;
    int *array = new int[N + 1];
    for (int i = 1; i <= N; ++i) {
        cin >> array[i];
    }
    int *stack = new int[N + 1];
    int top = 0;
    int *left = new int[N + 1];
    for (int i = 1; i <= N; ++i) {
        while (top > 0 && array[i] > array[stack[top - 1]])
            --top;
        left[i] = top?stack[top - 1]:0;
        stack[top++] = i;
    }
    top = 0;
    int *right = new int[N + 1];
    for (int i = N; i >= 1; --i) {
        while (top > 0 && array[i] < array[stack[top - 1]])
            --top;
        right[i] = top?stack[top - 1]:N + 1;
        stack[top++] = i;
    }
    long long ans = 0;
    vector<vector<int> > r;
    for (int i = 0; i <= N; ++i) {
        vector<int> temp;
        r.push_back(temp);
    }
    bit = new int[N + 1];
    memset(bit, 0, sizeof(int) * (N + 1));
    for (int L = N; L >= 1; --L) {
        for (auto & i : r[L]) {
            add(i, -1);
        }
        add(L, 1);
        r[left[L]].push_back(L);
        ans += ask(right[L] - 1);
    }
    cout << ans << endl;
    return 0;
}