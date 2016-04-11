#!/usr/bin/env python
# -*- coding: utf-8 -*-
# @Author: Zeyuan Shang
# @Date:   2015-12-28 23:04:55
# @Last Modified by:   Zeyuan Shang
# @Last Modified time: 2015-12-28 23:05:05
import math

def turan_theorem(n, r):
    g1 = n % r;
    g2 = r - g1;
    sz1 = n / r + 1;
    sz2 = n / r;
    ret = g1 * sz1 * g2 * sz2 + g1 * (g1 - 1) * sz1 * sz1 / 2 + g2 * (g2 - 1) * sz2 * sz2 / 2;
    return ret

if __name__ == "__main__":
    T = input()
    for _ in xrange(T):
        n, m = map(int, raw_input().split())
        low, high = 1, n
        while low < high:
            mid = (low + high) / 2
            if turan_theorem(n, mid) < m:
                low = mid + 1
            else:
                high = mid
        print low