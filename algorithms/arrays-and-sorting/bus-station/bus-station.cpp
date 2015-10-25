#include <iostream>
#include <vector>

using namespace std;

bool check(int current, const vector<int> &a, int index) {
    if (index >= a.size())
        return true;
    int x = current;
    while (index < a.size()) {
        x -= a[index];
        if (x < 0)
            return false;
        if (x == 0)
            x = current;
        ++index;
    }
    return x == current;
}

int main() {
    int n, max_value = 0, total_value = 0;
    cin >> n;
    vector<int> a;
    for (int i = 0; i < n; ++i) {
        int ele;
        cin >> ele;
        a.push_back(ele);
        max_value = max(max_value, ele);
        total_value += ele;
    }
    int current = 0;
    for (int i = 0; i < n; ++i) {
        current += a[i];
        if (current >= max_value && total_value % current == 0 && check(current, a, i + 1))
            cout << current << ' ';
    }
    cout << endl;
}