# -*- coding: utf-8 -*-
# @Author: Zeyuan Shang
# @Date:   2016-05-04 13:59:24
# @Last Modified by:   Zeyuan Shang
# @Last Modified time: 2016-05-04 14:04:30
s = raw_input()
k = input()

for i in xrange(len(s) / k):
	t = ''
	for c in s[i * k : (i + 1) * k]:
		if c in t:
			continue
		t += c
	print t