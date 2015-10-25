#include <vector>
#include <iostream>

using namespace std;

#define MOD 1000007

int main() {
    int N;
    cin >> N;
    vector<bool> isPrime(N + 1, false);
    vector<int> primes;
    for (int i = 2; i <= N; ++i) {
        if (isPrime[i] == false) {
            primes.push_back(i);
            for (int j = 2; i * j <= N; ++j)
                isPrime[i * j] = true;
        }
    }
    long long ans = 1;
    for (auto i : primes) {
        int exp = 0, tmp = N;
        while (tmp > 0) {
            exp += tmp / i;
            tmp /= i;
        }
        ans = (ans * ((2 * exp + 1) % MOD)) % MOD;
    }
    cout << ans << endl;
    return 0;
}
