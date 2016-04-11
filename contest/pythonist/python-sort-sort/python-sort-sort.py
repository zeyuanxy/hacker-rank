# -*- coding: utf-8 -*-
# @Author: Zeyuan Shang
# @Date:   2016-04-11 22:07:07
# @Last Modified by:   Zeyuan Shang
# @Last Modified time: 2016-04-11 22:07:17
from operator import itemgetter

if __name__ == "__main__":
    N, M = map(int, raw_input().split())
    arr = []
    for _ in xrange(N):
        arr.append(map(int, raw_input().split()))
    K = input()
    arr = sorted(arr, key = itemgetter(K))
    for i in xrange(N):
        print ' '.join(str(x) for x in arr[i])