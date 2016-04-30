# -*- coding: utf-8 -*-
# @Author: Zeyuan Shang
# @Date:   2016-04-30 19:35:03
# @Last Modified by:   Zeyuan Shang
# @Last Modified time: 2016-04-30 19:38:26

if __name__ == "__main__":
	n, d = map(int, raw_input().split())
	a = map(int, raw_input().split())
	ele = set()
	for x in a:
		ele.add(x)

	ans = 0
	for x in a:
		x1, x2 = x + d, x + 2 * d
		if x1 in ele and x2 in ele:
			ans += 1
	print ans