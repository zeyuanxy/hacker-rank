#!/usr/bin/env python
# -*- coding: utf-8 -*-
# @Author: Zeyuan Shang
# @Date:   2015-12-29 18:32:55
# @Last Modified by:   Zeyuan Shang
# @Last Modified time: 2015-12-29 18:33:05
if __name__ == "__main__":
    T = input()
    for _ in xrange(T):
        n = input()
        arr = map(int, raw_input().split())
        ans = 0
        for i in xrange(n):
            m = (i + 1) * (n - i)
            if m % 2 == 1:
                ans ^= arr[i]
        print ans