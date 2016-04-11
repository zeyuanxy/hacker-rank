/* 
* @Author: Zeyuan Shang
* @Date:   2015-12-23 21:56:37
* @Last Modified by:   Zeyuan Shang
* @Last Modified time: 2015-12-23 21:56:43
*/

#include <cmath>
#include <cstdio>
#include <vector>
#include <iostream>
#include <algorithm>
using namespace std;

void quickSort(vector<int>& arr, int l, int r) {
    if (l < r) {
        int pivot = arr[r];
        int i = l - 1, j;
        for (;;) {
            for (i++; i < r && arr[i] <= pivot; i++);
            for (j = i; j < r && arr[j] > pivot; j++);
            if (j >= r) {
                break;
            }
            swap(arr[i], arr[j]);
        }
        swap(arr[i], arr[r]);
        for (int index = 0; index < arr.size(); ++index) {
            if (index < arr.size() - 1) {
                cout << arr[index] << " ";
            } else {
                cout << arr[index] << endl;
            }
        }
        quickSort(arr, l, i - 1);
        quickSort(arr, i + 1, r);
    }
}

int main() {
    int n;
    cin >> n;
    vector<int> arr(n);
    for (int i = 0; i < n; ++i) {
        cin >> arr[i];
    }
    quickSort(arr, 0, n - 1);
    return 0;
}
