# -*- coding: utf-8 -*-
# @Author: Zeyuan Shang
# @Date:   2016-05-04 20:45:59
# @Last Modified by:   Zeyuan Shang
# @Last Modified time: 2016-05-04 20:52:32
from itertools import product

K, M = map(int, raw_input().split())
N = []

for _ in xrange(K):
	N.append(map(int, raw_input().split())[1:])
ans = 0
for i in product(*N):
	ans = max(ans, sum(map(lambda x : x * x, i)) % M)

print ans