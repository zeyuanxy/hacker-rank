#include <cmath>
#include <cstdio>
#include <vector>
#include <iostream>
#include <algorithm>

using namespace std;

int largestRectangleArea(const vector<int>& height) {
    int n = height.size();
    if (n == 0) {
        return 0;
    }
    
    vector<int> l(n), r(n);
    for (int i = 0; i < n; ++i) {
        l[i] = i;
        while (l[i] > 0 && height[l[i] - 1] >= height[i]) {
            l[i] = l[l[i] - 1];
        }
    }
    for (int i = n - 1; i >= 0; --i) {
        r[i] = i;
        while (r[i] < n - 1 && height[r[i] + 1] >= height[i]) {
            r[i] = r[r[i] + 1];
        }
    }
    int ans = 0;
    for (int i = 0; i < n; ++i) {
        ans = max(ans, (r[i] - l[i] + 1) * height[i]);
    }
    return ans;
}

int main() {
    int N;
    cin >> N;
    vector<int> height;
    for (int i = 0; i < N; ++i) {
        int h;
        cin >> h;
        height.push_back(h);
    }
    
    cout << largestRectangleArea(height) << endl;
    
    return 0;
}
