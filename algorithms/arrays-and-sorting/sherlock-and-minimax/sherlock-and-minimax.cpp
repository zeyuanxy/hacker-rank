#include <iostream>
#include <vector>
#include <algorithm>

using namespace std;

int main() {
    int N;
    cin >> N;
    vector<int> A;
    for (int i = 0; i < N; ++i) {
        int ele;
        cin >> ele;
        A.push_back(ele);
    }
    sort(A.begin(), A.end());
    int P, Q;
    cin >> P >> Q;
    int value = 0, ans = 0;
    if (P <= A[0]) {
        value = A[0] - P;
        ans = P;
    }
    if (A[A.size() - 1] <= Q && value < Q - A[A.size() - 1]) {
        value = Q - A[A.size() - 1];
        ans = Q;
    }
    for (int i = 0; i < N - 1; ++i) {
        int mid = (A[i] + A[i + 1]) / 2;
        if (mid >= P && mid <= Q && value < min(A[i + 1] - mid, mid - A[i])) {
            value = min(A[i + 1] - mid, mid - A[i]);
            ans = mid;
        } else if (A[i] <= P && P <= A[i + 1] && value < min(P - A[i], A[i + 1] - P)) {
            value = min(P - A[i], A[i + 1] - P);
            ans = P;
        } else if (A[i] <= Q && Q <= A[i + 1] && value < min(Q - A[i], A[i + 1] - Q)) {
            value = min(Q - A[i], A[i + 1] - Q);
            ans = Q;
        }
    }
    cout << ans << endl;
    return 0;
}