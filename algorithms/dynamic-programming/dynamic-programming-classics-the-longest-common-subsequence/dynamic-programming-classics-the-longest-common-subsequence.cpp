#include <vector>
#include <iostream>

using namespace std;

int main() {
    int n, m;
    cin >> n >> m;
    vector<int> a(n), b(m);
    for (int i = 0; i < n; ++i)
        cin >> a[i];
    for (int i = 0; i < n; ++i)
        cin >> b[i];
    vector<vector<int>> dp(n, vector<int>(m));
    vector<vector<int>> way(n, vector<int>(m));
    for (int i = 0; i < n; ++i) {
        for (int j = 0; j < m; ++j) {
            if (a[i] == b[j]) {
                dp[i][j] = 1;
                if (i > 0 && j > 0)
                    dp[i][j] += dp[i - 1][j - 1];
            } else {
                if (i > 0) {
                    dp[i][j] = dp[i - 1][j];
                    way[i][j] = 1;
                }
                if (j > 0 && dp[i][j] < dp[i][j - 1]) {
                    dp[i][j] = dp[i][j - 1];
                    way[i][j] = 2;
                }
            }
        }
    }
    vector<int> ans;
    int i = n - 1, j = m - 1;
    while (i >= 0 && j >= 0) {
        if (a[i] == b[j]) {
            ans.push_back(a[i]);
            --i, --j;
        } else {
            if (way[i][j] == 1)
                --i;
            else
                --j;
        }
    }
    for (int k = ans.size() - 1; k >= 0; --k)
        cout << ans[k] << " ";
    cout << endl;
    return 0;
}
