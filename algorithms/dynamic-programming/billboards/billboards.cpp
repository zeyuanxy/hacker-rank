#include <iostream>
#include <vector>
#include <deque>
using namespace std;

#define g(i) f[i] + a[i]

int main() {
    int N, K;
    cin >> N >> K;
    vector<long long> a(N), f(N + 1);
    long long sum = 0;
    for (int i = 0; i < N; ++i) {
        cin >> a[i];
        sum += a[i];
    }
    deque<long long> mq;
    for (int i = 0; i < K; ++i) {
        while (!mq.empty() && g(i) <= g(mq.back()))
            mq.pop_back();
        mq.push_back(i);
    }
    for (int i = K; i < N; ++i) {
        while (!mq.empty() && g(i) <= g(mq.back()))
            mq.pop_back();
        mq.push_back(i);
        f[i + 1] = g(mq.front());
        if (mq.front() == i - K)
            mq.pop_front();
    }
    cout << sum - f[N] << endl;
    return 0;
}
