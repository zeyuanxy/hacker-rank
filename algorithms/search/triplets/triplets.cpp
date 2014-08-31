#include <iostream>
#include <vector>
#include <algorithm>
#include <unordered_map>

using namespace std;

int main() {
    int N;
    cin >> N;
    vector<int> left, right, v;
    v.resize(N);
    left.resize(N);
    right.resize(N);
    vector<int> v1, v2;
    v1.reserve(N);
    v2.reserve(N);
    unordered_map<int, int> m1, m2;
    for (int i = 0; i < N; ++i) {
        int ele;
        cin >> ele;
        v[i] = ele;
        auto iter = lower_bound(v1.begin(), v1.end(), v[i]);
        left[i] = iter - v1.begin();
        if (*iter != v[i]) {
            v1.insert(iter, v[i]);
            m1[v[i]] = left[i];
        } else {
            m1[v[i]] = min(m1[v[i]], left[i]);
        }
    }
    long long ans = 0;
    for (int i = N - 1; i >= 0; --i) {
        auto iter = upper_bound(v2.begin(), v2.end(), v[i]);
        right[i] = v2.end() - iter;
        ans += left[i] * right[i];
        if (iter == v2.begin() || (*(iter - 1) != v[i])) {
            m2[v[i]] = right[i];
            v2.insert(iter, v[i]);
        }
        else {
            m2[v[i]] = min(m2[v[i]], right[i]);
            ans -= m1[v[i]] * m2[v[i]];
        }
    }
    cout << ans << endl;
}