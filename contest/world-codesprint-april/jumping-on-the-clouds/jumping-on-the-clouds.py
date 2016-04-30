# -*- coding: utf-8 -*-
# @Author: Zeyuan Shang
# @Date:   2016-04-30 19:27:41
# @Last Modified by:   Zeyuan Shang
# @Last Modified time: 2016-04-30 19:31:52

if __name__ == "__main__":
	n = input()
	c = map(int, raw_input().split())
	f = [(n + 1)] * n
	f[0] = 0
	for i in xrange(1, n):
		if c[i] == 1:
			continue
		f[i] = min(f[i], f[i - 1] + 1)
		if i >= 2:
			f[i] = min(f[i], f[i - 2] + 1)

	print f[n - 1]