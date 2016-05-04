# -*- coding: utf-8 -*-
# @Author: Zeyuan Shang
# @Date:   2016-05-04 13:29:41
# @Last Modified by:   Zeyuan Shang
# @Last Modified time: 2016-05-04 13:29:52
N, M = map(int,raw_input().split()) # More than 6 lines of code will result in 0 score. Blank lines are not counted.
for i in xrange(1,N,2): 
    print (str('.|.') * i).center(M, '-')
print str('WELCOME').center(M, '-')
for i in xrange(N-2,-1,-2): 
    print (str('.|.') * i).center(M, '-')