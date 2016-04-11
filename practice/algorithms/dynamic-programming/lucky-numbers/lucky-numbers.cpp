#include <iostream>
#include <cstring>

using namespace std;

const int N = 18;
const int N9 = 9 * N;
const int N99 = 9 * 9 * N;

bool isPrime[N99+1];
long long lucky[N][N9+1][N99+1];
int digit[20];

void init() {
    memset(lucky, -1, sizeof(lucky));
    memset(isPrime, true, sizeof(isPrime));
    isPrime[0] = isPrime[1] = false;
    for(int i = 2; i * i <= N99; i++) {
        if(isPrime[i]) {
            for(int j = i + i; j <= N99; j += i) {
                isPrime[j] = false;
            }
        }
    }
}

long long dfs2(int n, int digit_sum, int digit_square_sum) {
    if (n < 0) {
        return isPrime[digit_sum] && isPrime[digit_square_sum];
    }

    if (lucky[n][digit_sum][digit_square_sum] != -1) {
        return lucky[n][digit_sum][digit_square_sum];
    }

    long long total = 0;
    for (int i = 0; i <= 9; ++i) {
        total += dfs2(n - 1, digit_sum + i, digit_square_sum + i * i);
    }
    lucky[n][digit_sum][digit_square_sum] = total;

    return total;
}

long long dfs1(int n, int digit_sum, int digit_square_sum) {
    if(n < 0) {
        return isPrime[digit_sum] && isPrime[digit_square_sum];
    }

    long long total = 0;
    for (int i = 0; i < digit[n]; ++i) {
        total += dfs2(n - 1, digit_sum + i, digit_square_sum + i * i);
    }
    total += dfs1(n - 1, digit_sum + digit[n], digit_square_sum + digit[n] * digit[n]);

    return total;
}

long long solve(long long num) {
    int len = 0;
    while(num) {
        digit[len++] = num % 10;
        num /= 10;
    }
    return dfs1(len - 1, 0, 0);
}

int main() {
    init();
    int T;
    cin >> T;
    long long A, B;
    while (T--) {
        cin >> A >> B;
        cout << solve(B) - solve(A - 1) << endl;
    }
    return 0;
}