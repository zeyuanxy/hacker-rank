#include <vector>
#include <iostream>

using namespace std;

#define MOD 1000000007

long long solve(const string &a, const string &b) {
    int M = a.length(), N = b.length();
    vector<vector<int> > dp(M, vector<int>(N));
    for (int i = 0; i < N; ++i) {
        if (a[0] == b[i])
            dp[0][i] = 1;
        if (i > 0)
            dp[0][i] += dp[0][i - 1];
        dp[0][i] %= MOD;
    }
    for (int i = 1; i < M; ++i) {
        dp[i][0] = dp[i - 1][0];
        for (int j = 1; j < N; ++j) {
            dp[i][j] = dp[i - 1][j] + dp[i][j - 1];
            if (a[i] != b[j])
                dp[i][j] -= dp[i - 1][j - 1]; 
            dp[i][j] %= MOD;
        }
    }
    return dp[M - 1][N - 1];
}

int main() {
    int T;
    cin >> T;
    while (T--) {
        string s;
        cin >> s;
        int N = s.length();
        long long ans = 0;
        for (int i = 1; i < N; ++i)
            ans = (ans + solve(s.substr(i, N - i), s.substr(0, i))) % MOD;
        cout << ans << endl;
    }
    return 0;
}
