#include <vector>
#include <iostream>
#include <queue>

using namespace std;

int main() {
      int n, m;
          cin >> n >> m;
              vector<int> count(n, 1), tree(n, -1);
                  for (int i = 0; i < m; ++i) {
                            int a, b;
                                    cin >> a >> b;
                                            --a, --b;
                                                    tree[a] = b;
                                                            count[b] += count[a];
                                                                    int root = tree[b];
                                                                            while (root != -1) {
                                                                                          count[root] += count[a];
                                                                                                      root = tree[root];
                                                                                                              }
                                                                                }
                      int ans = 0;
                          for (int i = 0; i < n; ++i)
                                    if (count[i] % 2 == 0)
                                                  ++ans;
                              cout << ans - 1 << endl;
                                  return 0;
}

