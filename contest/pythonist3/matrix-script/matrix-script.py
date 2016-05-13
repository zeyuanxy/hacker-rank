# -*- coding: utf-8 -*-
# @Author: Zeyuan Shang
# @Date:   2016-05-13 13:09:26
# @Last Modified by:   Zeyuan Shang
# @Last Modified time: 2016-05-13 13:18:45
import re

matrix = []
N, M = map(int, raw_input().split())
for _ in xrange(N):
	matrix.append(list(raw_input()))
all_script = ''.join(''.join(line) for line in zip(*matrix))
print re.sub(r'(?<=[A-Za-z0-9])([^A-Za-z0-9]+)(?=[A-Za-z0-9])', ' ', all_script)