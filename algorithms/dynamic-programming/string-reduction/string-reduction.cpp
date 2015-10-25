#include <iostream>
#include <vector>
using namespace std;

int solve(string &s) {
    int len = s.length();
    bool flag = true;
    for (int j = 1; j < len; ++j)
        if (s[j] != s[j - 1]) {
            flag = false;
        }
    if (flag)
        return len;
    vector<int> count(3);
    for (int j = 0; j < len; ++j)
        ++count[s[j] - 'a'];
    if (len % 2 == 0) {
        for (int j = 0; j < 3; ++j)
            if (count[j] % 2 != 0)
                return 1;
        return 2;
    } else {
        for (int j = 0; j < 3; ++j)
            if (count[j] % 2 == 0)
                return 1;
        return 2;
    }
}

int main() {
    int T;
    cin >> T;
    for (int i = 0; i < T; ++i) {
        string s;
        cin >> s;
        cout << solve(s) << endl;
    }
    return 0;
}
