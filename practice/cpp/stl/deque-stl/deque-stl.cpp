/* 
* @Author: Zeyuan Shang
* @Date:   2016-01-19 20:22:44
* @Last Modified by:   Zeyuan Shang
* @Last Modified time: 2016-01-19 20:22:50
*/

#include <iostream>
#include <deque>
#include <vector>

using namespace std;

void slidingWindowMax(const vector<int> &arr, int k) {
    deque<int> dq;
    int n = arr.size();
    for (int i = 0; i < n; ++i) {
        while (!dq.empty() && arr[i] > dq.back()) {
            dq.pop_back();
        }
        dq.push_back(arr[i]);
        if (i >= k && dq.front() == arr[i - k]) {
            dq.pop_front();
        }
        if (i >= k - 1) {
            if (i < n - 1) {
                cout << dq.front() << " ";
            } else {
                cout << dq.front() << endl;
            }
        }
    }
}

int main() {
    int t;
    cin >> t;
    while (t--) {
        int n, k;
        cin >> n >> k;
        vector<int> arr(n);
        for (int i = 0; i < n; ++i) {
            cin >> arr[i];
        }
        slidingWindowMax(arr, k);
    }
}
