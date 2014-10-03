#include <cmath>
#include <cstdio>
#include <iostream>
#include <algorithm>
using namespace std;


int main() {
    int T;
    cin >> T;
    while (T--) {
        string s;
        cin >> s;
        if (next_permutation(s.begin(), s.end()) == false)
            cout << "no answer" << endl;
        else 
            cout << s << endl;
    }
    return 0;
}