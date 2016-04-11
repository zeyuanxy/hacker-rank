#include <unordered_set>
#include <iostream>
#include <cmath>

using namespace std;

long long gcd(long long a, long long b) {
    if (b == 0)
        return a;
    else
        return gcd(b, a % b);
}

int main() {
    int N;
    long long K;
    cin >> N >> K;
    unordered_set<long long> gcds;
    for (int i = 0; i < N; ++i) {
        long long ele;
        cin >> ele;
        gcds.insert(gcd(ele, K));
    }
    long long ans = 0;
    for (long long i = 1; i * i <= K; ++i)
        if (K % i == 0) {
            bool flag = true;
            for (auto & j : gcds)
                if (j % i == 0) {
                    flag = false;
                    break;
                }
            if (flag)
                ++ans;
            if (i * i != K) {
                long long d = K / i;
                flag = true;
                for (auto & j : gcds)
                    if (j % d == 0) {
                        flag = false;
                        break;
                    }
                if (flag)
                    ++ans;
            }
        }
    cout << ans << endl;
    return 0;
}
