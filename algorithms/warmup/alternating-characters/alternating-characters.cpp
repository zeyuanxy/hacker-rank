#include <iostream>

using namespace std;

int main() {
    int T;
    cin >> T;
    while (T-- > 0) {
        string s;
        cin >> s;
        char cur = s[0];
        int ans = 0;
        for (int i = 1; i < s.length(); ++i)
            if (s[i] != cur)
                cur = s[i];
            else
                ++ans;
        cout << ans << endl;
    }
    return 0;
}