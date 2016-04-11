#include <vector>
#include <iostream>
using namespace std;

bool checkHamilton(vector<int> &a, int k) {
    int n = a.size();
    vector<vector<int> > road(n, vector<int>(n));
    vector<int> d(n);
    for (int i = 0; i < n; ++i) {
        for (int j = i + 1; j < n; ++j) {
            if ((a[i] ^ a[j]) >= (1LL << k)) {
                road[i][j] = 1;
                road[j][i] = 1;
                ++d[i];
                ++d[j];
            }
        }
    }
    for (int k = 0; k < n; ++k) {
        for (int i = 0; i < n; ++i) {
            if (road[i][k]) {
                for (int j = 0; j < n; ++j) {
                    if (road[k][j])
                        road[i][j] = 1;
                }
            }
        }
    }
    for (int i = 0; i < n; ++i) {
        for (int j = i + 1; j < n; ++j) {
            if (road[i][j] == 0)
                return false;
            if (d[i] + d[j] < n)
                return false;
        }
    }
    return true;
}

int main() {
    int N;
    cin >> N;
    vector<int> a(N);
    for (int i = 0; i < N; ++i)
        cin >> a[i];
    int ret = 0;
    for (int i = 31; i >= 0; --i) {
        if (checkHamilton(a, i)) {
            ret = i;
            break;
        }
    }
    cout << ret << endl;
    return 0;
}
