#include <iostream>
#include <vector>
#include <map>

using namespace std;

int main() {
	int N, M;
	cin >> N >> M;
    vector<long long> A, B, C;
    map<int, int> factor;
    for (int i = 0; i < N; ++i) {
        int ele;
        cin >> ele;
        A.push_back(ele);
    }
    for (int i = 0; i < M; ++i) {
        int ele;
        cin >> ele;
        B.push_back(ele);
    }
    for (int i = 0; i < M; ++i) {
        int ele;
        cin >> ele;
        C.push_back(ele);
    }
    for (int i = 0; i < M; ++i)
        if (factor.find(B[i]) != factor.end())
            factor[B[i]] = (factor[B[i]] * C[i]) % 1000000007;
        else
            factor[B[i]] = C[i];
    for (auto & i : factor)
        for (int j = i.first; j <= N; j += i.first)
            A[j - 1] = (A[j - 1] * i.second) % 1000000007;
    for (int i = 0; i < N; ++i)
        cout << A[i] << ' ';
    cout << endl;
    return 0;
}