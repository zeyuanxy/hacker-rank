#include <iostream>
#include <unordered_map>

using namespace std;

int main() {
    int T;
    cin >> T;
    for (int i = 0; i < T; ++i) {
        int N;
        cin >> N;
        unordered_map<int, int> M;
        for (int i = 0; i < N; ++i) {
            int ele;
            cin >> ele;
            ++M[ele];
        }
        long long ans = 0;
        for (auto & i : M)
            ans += (long long)i.second * (i.second - 1);
        cout << ans << endl;
    }
    return 0;
}