#include <iostream>
#include <vector>
#include <map>
#include <cmath>
#include <set>
#include <iomanip>

using namespace std;

multiset<int> s1, s2;

void findMedian() {
    if (s1.empty()) {
        cout << "Wrong!" << endl;
        return;
    }
    if (s1.size() == s2.size()) {
        long long a = (long long)*s1.rbegin() + (long long)*s2.begin();
        if (a % 2 == 0) {
            cout << a / 2 << endl;
        }
        else {
            cout << fixed << setprecision(1) << a / 2.0 << endl;
        }
    } else
        cout << *s1.rbegin() << endl;
}

void add(int x) {
    if (s1.empty()) {
        s1.insert(x);
    } else if (s1.size() == s2.size()) {
        s2.insert(x);
        s1.insert(*s2.begin());
        s2.erase(s2.begin());
    } else {
        s1.insert(x);
        s2.insert(*s1.rbegin());
        s1.erase(s1.find(*s1.rbegin()));
    }
    findMedian();
}

void remove(int x) {
    auto it1 = s1.find(x), it2 = s2.find(x);
    if (it1 == s1.end() && it2 == s2.end()) {
        cout << "Wrong!" << endl;
        return;
    }
    if (s1.size() == s2.size()) {
        if (it2 != s2.end()) {
            s2.erase(it2);
        } else {
            s1.erase(it1);
            s1.insert(*s2.begin());
            s2.erase(s2.begin());
        } 
    } else if (it1 != s1.end()) {
        s1.erase(it1);
    } else {
        s2.erase(it2);
        s2.insert(*s1.rbegin());
        s1.erase(s1.find(*s1.rbegin()));
    }
    findMedian();
}

int main() {
    int N;
    cin >> N;
    for (int i = 0; i < N; ++i) {
        char c;
        cin >> c;
        int ele;
        cin >> ele;
        if (c == 'a')
            add(ele);
        else
            remove(ele);
    }
}