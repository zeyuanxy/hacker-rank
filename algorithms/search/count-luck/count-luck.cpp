#include <iostream>
#include <vector>

using namespace std;

void dfs(vector<vector<char>> &mat, vector<vector<int>> &cnt, int x, int y, int cur_cnt) {
    int dx[4] = {1, -1, 0, 0}, dy[4] = {0, 0, 1, -1};
    int n = mat.size(), m = mat[0].size();
    int count = 0;
    for (int i = 0; i < 4; ++i) {
        int xx = x + dx[i], yy = y + dy[i];
        if (xx >= 0 && xx < n && yy >= 0 && yy < m && mat[xx][yy] != 'X' && cnt[xx][yy] < 0)
            ++count;
    }
    if (count > 1)
        count = 1;
    else
        count = 0;
    for (int i = 0; i < 4; ++i) {
        int xx = x + dx[i], yy = y + dy[i];
        if (xx >= 0 && xx < n && yy >= 0 && yy < m && mat[xx][yy] != 'X' && cnt[xx][yy] < 0) {
            cnt[xx][yy] = cur_cnt + count;
            dfs(mat, cnt, xx, yy, cnt[xx][yy]);
        }
    }
}

int main() {
    int T;
    cin >> T;
    while (T-- > 0) {
        int n, m;
        cin >> n >> m;
        vector<vector<char>> mat(n, vector<char>(m));
        vector<vector<int>> cnt(n, vector<int>(m, -1));
        int tx = -1, ty = -1, dx = -1, dy = -1;
        for (int i = 0; i < n; ++i)
            for (int j = 0; j < m; ++j) {
                cin >> mat[i][j];
                if (mat[i][j] == 'M') {
                    tx = i;
                    ty = j;
                }
                if (mat[i][j] == '*') {
                    dx = i;
                    dy = j;
                }
            }
        cnt[tx][ty] = 0;
        dfs(mat, cnt, tx, ty, 0);
        int k = 0;
        cin >> k;
        if (cnt[dx][dy] == k)
            cout << "Impressed" << endl;
        else
            cout << "Oops!" << endl;
    }
    return 0;
}
