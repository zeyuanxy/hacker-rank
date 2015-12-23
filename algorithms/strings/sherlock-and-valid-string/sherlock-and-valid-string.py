#!/usr/bin/env python
# -*- coding: utf-8 -*-
# @Author: Zeyuan Shang
# @Date:   2015-12-23 21:42:47
# @Last Modified by:   Zeyuan Shang
# @Last Modified time: 2015-12-23 21:42:54
import collections

if __name__ == "__main__":
    s = raw_input()
    cnt = collections.Counter(s)
    cnt = collections.Counter(cnt.values())
    if len(cnt) == 1 or (len(cnt) == 2 and min(cnt.values()) == 1):
        print 'YES'
    else:
        print 'NO'