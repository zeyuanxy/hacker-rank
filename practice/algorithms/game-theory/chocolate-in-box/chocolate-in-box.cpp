/* 
* @Author: Zeyuan Shang
* @Date:   2015-12-26 15:39:49
* @Last Modified by:   Zeyuan Shang
* @Last Modified time: 2015-12-26 15:39:55
*/

#include <cmath>
#include <cstdio>
#include <vector>
#include <iostream>
#include <algorithm>

using namespace std;


int main() {
    int n;
    cin >> n;
    vector<long long> arr(n);
    long long total_xor = 0;
    for (int i = 0; i < n; ++i) {
        cin >> arr[i];
        total_xor ^= arr[i];
    }
    int ans = 0;
    for (int i = 0; i < n; ++i) {
        if ((total_xor ^ arr[i]) < arr[i]) {
            ++ans;
        }
    }
    cout << ans << endl;
    return 0;
}
