#include <iostream>
#include <vector>
#include <algorithm>

using namespace std;

#define M 100

bool pair_compare(const pair<int, long long> &a, const pair<int, long long> &b) {
    return a.second == b.second ? a.first < b.first : a.second < b.second;
}

int main() {
    int N;
    cin >> N;
    vector<pair<long long, long long> > pos;
    long long avg_x = 0, avg_y = 0;
    for (int i = 0; i < N; ++i) {
        int x, y;
        cin >> x >> y;
        pos.push_back(make_pair(x, y));
        avg_x += x;
        avg_y += y;
    }
    avg_x /= N, avg_y /= N;
    vector<pair<int, long long> > ans;
    for (int i = 0; i < N; ++i) {
        long long dis = max(abs(pos[i].first - avg_x), abs(pos[i].second - avg_y));
        ans.push_back(make_pair(i, dis));
    }
    sort(ans.begin(), ans.end(), pair_compare);
    long long ret = 1e16;
    for (int i = 0; i < min(M, int(ans.size())); ++i) {
        long long tmp = 0;
        for (int j = 0; j < N; ++j)
            tmp += max(abs(pos[j].first - pos[ans[i].first].first), abs(pos[j].second - pos[ans[i].first].second));
        ret = min(ret, tmp);
    }
    cout << ret << endl;
    return 0;
}
