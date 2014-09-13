#include <iostream>
#include <vector>
using namespace std;

#define MOD 1000000007

void init_matrix(int n, int start, int t, vector<vector<long long> > &mat) {
    for (int i = 0; i < n; ++i)
        mat[i][i] = 1;
    for (int i = 0; i < t; ++i) {
        int x = (start + i) % n;
        int y = (start + i + n - 1) % n;
        int z = (start + i + 1) % n;
        for (int j = 0; j < n; ++ j)
            mat[x][j] = (mat[x][j] + mat[y][j] + mat[z][j]) % MOD;
    }
}

void mul_matrix(int n, vector<vector<long long> > &a, vector<vector<long long> > &b, vector<vector<long long> > &c) {
    vector<vector<long long> > tmp(n, vector<long long>(n));
    for (int i = 0; i < n; ++i)
        for (int j = 0; j < n; ++j) {
            tmp[i][j] = 0;
            for (int k = 0; k < n; ++k)
                tmp[i][j] = (tmp[i][j] + a[i][k] * b[k][j]) % MOD;
        }
    for (int i = 0; i < n; ++ i)
        for (int j = 0; j < n; ++ j)
            c[i][j] = tmp[i][j];
}

void pow_matrix(int n, vector<vector<long long> > &mat, int exp) {
    vector<vector<long long> > ans(n, vector<long long>(n));
    for (int i = 0; i < n; ++i)
        ans[i][i] = 1;
    while (exp) {
        if (exp % 2 == 1)
            mul_matrix(n, mat, ans, ans);
        mul_matrix(n, mat, mat, mat);
        exp >>= 1;
    }
    for (int i = 0; i < n; ++ i)
        for (int j = 0; j < n; ++ j)
            mat[i][j] = ans[i][j];
}

void rotate_matrix(int n, vector<vector<long long> > &mat, int k) {
    vector<vector<long long> > tmp(n, vector<long long>(n));
    for (int i = 0; i < n; ++ i)
        for (int j = 0; j < n; ++ j) {
            tmp[(i + k) % n][(j + k) % n] = mat[i][j];
        }
    for (int i = 0; i < n; ++ i)
        for (int j = 0; j < n; ++ j)
            mat[i][j] = tmp[i][j];
}

void vmul_matrix(int n, vector<vector<long long> > &mat, vector<long long> &x, vector<long long> &y) {
    for (int i = 0; i < n; ++ i) y[i] = 0;
    for (int i = 0; i < n; ++ i) 
        for (int j = 0; j < n; ++ j) 
            y[i] = (y[i] + x[j] * mat[i][j]) % MOD;
}

int main() {
    int T;
    cin >> T;
    while (T--) {
        int N, M;
        cin >> N >> M;
        vector<long long> x(N), ans(N);
        for (int i = 0; i < N; ++i)
            cin >> x[i];
        vector<vector<long long> > A(N, vector<long long>(N));
        init_matrix(N, 0, N, A);
        pow_matrix(N, A, M / N);
        for (int i = 0; i < N; ++ i) {
            if (i != 0) rotate_matrix(N, A, 1);
            vector<vector<long long> > B(N, vector<long long>(N));
            init_matrix(N, i, M % N, B);
            mul_matrix(N, B, A, B);
            vmul_matrix(N, B, x, ans);
            for (int i = 0; i < N; ++ i)
                cout << ans[i] << ' ';
            cout << endl;
        }
        cout << endl;
    }
    return 0;
}
