# -*- coding: utf-8 -*-
# @Author: Zeyuan Shang
# @Date:   2016-05-04 20:42:41
# @Last Modified by:   Zeyuan Shang
# @Last Modified time: 2016-05-04 20:43:41
s = raw_input()
n = len(s)
player1, player2 = 0, 0

for i in xrange(len(s)):
	if s[i] in "AEIOU":
		player1 += n - i
	else:
		player2 += n - i

if player1 > player2:
    print "Kevin", player1
elif player1 < player2:
    print "Stuart", player2
else:
    print "Draw"