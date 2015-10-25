#include <iostream>
#include <vector>

using namespace std;

int bitCount(unsigned int u) {
   unsigned int uCount;
   uCount = u - ((u >> 1) & 033333333333) - ((u >> 2) & 011111111111);
   return ((uCount + (uCount >> 3)) & 030707070707) % 63;
}

int main() {
    int N, M;
    cin >> N >> M;
    vector<vector<int> > bm(N);
    int len = (M - 1) % 32 + 1;
    for (int i = 0; i < N; ++i) {
        bm[i].resize(len);
        string s;
        cin >> s;
        int k = -1;
        for (int j = 0; j < M; ++j) {
            if (j % 32 == 0) {
                ++k;
            }
            bm[i][k] *= 2;
            bm[i][k] += s[j] - '0';
        }
    }
    int topicCount = 0, teamCount = 0;
    for (int i = 0; i < N; ++i) {
        for (int j = i + 1; j < N; ++j) {
            int count = 0;
            for (int k = 0; k < len; ++k) {
                unsigned int tmp = bm[i][k] | bm[j][k];
                count += bitCount(tmp);
            }
            if (count > topicCount) {
                topicCount = count;
                teamCount = 1;
            } else if (count == topicCount) {
                teamCount++;
            }
        }
    }
    cout << topicCount << endl;
    cout << teamCount << endl;
    return 0;
}