# -*- coding: utf-8 -*-
# @Author: Zeyuan Shang
# @Date:   2016-05-13 13:42:03
# @Last Modified by:   Zeyuan Shang
# @Last Modified time: 2016-05-13 13:42:08
T = input()
for _ in xrange(T):
    n = input()
    dp = [False] * (n + 1)
    for i in xrange(n + 1):
        res = False
        for j in [2, 3, 5]:
            if i >= j and not dp[i - j]:
                res = True
                break
        dp[i] = res
    if dp[n]:
        print 'First'
    else:
        print 'Second'