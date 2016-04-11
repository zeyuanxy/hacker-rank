/* 
* @Author: Zeyuan Shang
* @Date:   2015-12-26 15:47:52
* @Last Modified by:   Zeyuan Shang
* @Last Modified time: 2015-12-26 15:48:01
*/

#include <cmath>
#include <cstdio>
#include <vector>
#include <iostream>
#include <algorithm>

using namespace std;

int main() {
    int T;
    cin >> T;
    while (T--) {
        int n;
        cin >> n;
        vector<int> a(n), b(n);
        for (int i = 0; i < n; ++i) {
            cin >> a[i];
        }
        for (int i = 0; i < n; ++i) {
            cin >> b[i];
        }
        int res = 0;
        for (int i = 0; i < n; ++i) {
            res ^= abs(a[i] - b[i]) - 1;
        }
        if (res) {
            cout << "player-2" << endl;
        } else {
            cout << "player-1" << endl;
        }
    }
    return 0;
}
