# -*- coding: utf-8 -*-
# @Author: Zeyuan Shang
# @Date:   2016-05-04 11:38:17
# @Last Modified by:   Zeyuan Shang
# @Last Modified time: 2016-05-04 12:37:37

def output(c):
	s = '%.2f' % c.real
	s += ('-' if c.imag < 0 else '+') + '%.2fi' % abs(c.imag)
	print (s if s else '0.00')

c, d = [complex(*map(float, raw_input().split())) for i in range(2)]
output(c + d)
output(c - d)
output(c * d)
output(c / d)
output(abs(c))
output(abs(d))