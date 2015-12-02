/* 
* @Author: Zeyuan Shang
* @Date:   2015-12-02 17:43:28
* @Last Modified by:   Zeyuan Shang
* @Last Modified time: 2015-12-02 17:43:37
*/

#include <vector>
#include <iostream>
#include <algorithm>
#include <queue>

using namespace std;

struct Customer {
    int time, length;
    Customer() : time(0), length(0) {
    }
    bool operator<(const Customer& c) const {
        return length > c.length;
    }
};

int main() {
    int n;
    cin >> n;
    vector<Customer> c(n);
    for (int i = 0; i < n; ++i) {
        cin >> c[i].time >> c[i].length;
    }
    sort(c.begin(), c.end(), [](const Customer& a, const Customer& b) {
        return a.time < b.time;
    });
    
    priority_queue<Customer> pq;
    int curIndex = 0;
    long long curTime = 0, totalWaitingTime = 0;
    while (curIndex < n || !pq.empty()) {
        int i = 0;
        for (i = curIndex; i < n; ++i) {
            if (c[i].time <= curTime) {
                pq.push(c[i]);
            } else {
                break;
            }
        }
        curIndex = i;
        if (!pq.empty()) {
            Customer c = pq.top();
            totalWaitingTime += curTime + c.length - c.time;
            curTime += c.length;
            pq.pop();
        } else {
            if (curIndex < n) {
                curTime = c[curIndex].time;
            }
        }
    }
    cout << totalWaitingTime / n << endl;
    return 0;
}
