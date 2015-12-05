/* 
* @Author: Zeyuan Shang
* @Date:   2015-12-04 20:27:07
* @Last Modified by:   Zeyuan Shang
* @Last Modified time: 2015-12-04 20:27:14
*/

#include <cmath>
#include <cstdio>
#include <vector>
#include <iostream>
#include <algorithm>
#include <bitset>

using namespace std;

bool solve(unsigned long long n) {
    bitset<64> bs(n);
    bool ret = true;
    int lastBit = 63;
    while (n != 1) {
        if (bs.count() == 1) {
            n >>= 1;
        } else {
            int i = lastBit;
            for (; i >= 0; --i) {
                if (bs[i]) {
                    break;
                }
            }
            lastBit = i;
            n <<= 64 - i;
            n >>= 64 - i;
        }
        bs = n;
        ret = !ret;
    }
    return ret;
}

int main() {
    int T;
    cin >> T;
    unsigned long long n;
    for (int i = 0; i < T; ++i) {
        cin >> n;
        if (solve(n)) {
            cout << "Richard" << endl;
        } else {
            cout << "Louise" << endl;
        }
    }
    return 0;
}
