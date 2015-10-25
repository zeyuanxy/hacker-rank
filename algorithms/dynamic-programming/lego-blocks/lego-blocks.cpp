#include <iostream>
#include <vector>

using namespace std;

const long long mod = 1000000007;

long long power(long long base, int degree) {
    long long ret = 1;
    while (degree) {
        if (degree % 2 == 1) {
            ret = ret * base % mod;
        }
        base = base * base % mod;
        degree /= 2;
    }
    return ret;
}

int main() {
    int T;
    cin >> T;
    vector<long long> f(1001);
    f[0] = 1;
    for (int i = 1; i <= 1000; ++i)
        for (int j = 1; j <= 4; ++j)
            if (i >= j)
                f[i] = (f[i] + f[i - j]) % mod;
    for (int i = 0; i < T; ++i) {
        int N, M;
        cin >> N >> M;
        vector<long long> g(M + 1), h(M + 1);
        for (int j = 1; j <= M; ++j)
            g[j] = power(f[j], N);
        h[1] = 1;
        for (int j = 2; j <= M; ++j) {
            long long sum = 0;
            for (int k = 1; k < j; ++k)
                sum = (sum + h[k] * g[j - k]) % mod;
            h[j] = (g[j] + mod - sum) % mod;
        }
        cout << h[M] << endl;
    }
    return 0;
}