#include <iostream>
#include <vector>

using namespace std;

int main() {
    int N;
    cin >> N;
    int *array = new int[N];
    for (int i = 0; i < N; ++i) {
        cin >> array[i];
    }
    int *stack = new int[N];
    int top = -1;
    int *left = new int[N];
    for (int i = 0; i < N; ++i) {
        while (top >= 0 && a[i] > a[stack[top]])
            --top;
        left[i] = (top >= 0)?stack[top]:-1;
        stack[++top] = i;
    }
    top = -1;
    int *right = new int[N];
    for (int i = N - 1; i >= 0; --i) {
        while (top >= 0 && a[i] < a[stack[top]])
            --top;
        right[i] = (top >= 0)?stack[top]:N;
        stack[++top] = i;
    }
    long long ans = 0;
    for (int i = N - 1; i >= 0; --i) {
        
    }
}