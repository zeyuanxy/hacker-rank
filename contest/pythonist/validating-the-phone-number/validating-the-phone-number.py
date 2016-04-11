# -*- coding: utf-8 -*-
# @Author: Zeyuan Shang
# @Date:   2016-04-11 22:30:15
# @Last Modified by:   Zeyuan Shang
# @Last Modified time: 2016-04-11 22:30:22
import re

if __name__ == "__main__":
    N = input()
    for i in xrange(N):
        s = raw_input()
        output = 'YES' if re.match('^[7-9]\d{9}$', s.rstrip()) else 'NO'
        print output