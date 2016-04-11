#!/usr/bin/env python
# -*- coding: utf-8 -*-
# @Author: Zeyuan Shang
# @Date:   2015-12-23 21:22:21
# @Last Modified by:   Zeyuan Shang
# @Last Modified time: 2015-12-23 21:22:27
def isPalindrome(s):
    return s == s[::-1]

def solve():
    s = raw_input()
    n = len(s)
    for i in xrange(n / 2):
        if s[i] != s[n - 1 - i]:
            if isPalindrome(s[i:n - 1 - i]):
                return n - 1 - i
            else:
                return i
    return n / 2
                
if __name__ == "__main__":
    T = input()
    for _ in xrange(T):
        print solve()
                