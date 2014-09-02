#include <iostream>
#include <vector>

using namespace std;

int main() {
    int N, M;
    cin >> N >> M;
    vector<long long> sum(N + 1);
    for (int i = 0; i < M; ++i) {
        int a, b, k;
        cin >> a >> b >> k;
        sum[a - 1] += k;
        sum[b] -= k;
    }
    long long ans = sum[0];
    for (int i = 1; i < N; ++i) {
        sum[i] += sum[i - 1];
        ans = max(ans, sum[i]);
    }
    cout << ans << endl;
    return 0;
}