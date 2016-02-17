#include <cmath>
#include <cstdio>
#include <vector>
#include <iostream>
#include <algorithm>
#include <stack>

using namespace std;

class MaximumStack {
public:
    MaximumStack() {
        maximumValue = 0;
    } 
    
    void push(long long value) {
        if (value > maximumValue) {
            s.push(maximumValue - value);
            maximumValue = value;
        } else {
            s.push(0);
        }
    }
    
    void pop() {
        long long diff = s.top();
        s.pop();
        maximumValue += diff;
    }
    
    long long getMaximumValue() {
        return maximumValue;
    }
    
private:
    stack<long long> s;
    long long maximumValue;
};

int main() {
    int N;
    cin >> N;
    
    MaximumStack s;
    for (int i = 0; i < N; ++i) {
        int type;
        cin >> type;
        if (type == 1) {
            int element;
            cin >> element;
            s.push(element);
        } else if (type == 2) {
            s.pop();
        } else if (type == 3) {
            cout << s.getMaximumValue() << endl;
        }
    }
    
    return 0;
}
