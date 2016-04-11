# -*- coding: utf-8 -*-
# @Author: Zeyuan Shang
# @Date:   2016-04-11 22:26:53
# @Last Modified by:   Zeyuan Shang
# @Last Modified time: 2016-04-11 22:27:02
import math

if __name__ == "__main__":
    N = input()
    d = int(math.log(N, 2)) + 2
    for i in xrange(1, N + 1):
        print '%*d%*o%*X' % (d - 1, i, d, i, d, i) + bin(i)[2:].rjust(d)