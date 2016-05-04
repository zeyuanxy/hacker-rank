# -*- coding: utf-8 -*-
# @Author: Zeyuan Shang
# @Date:   2016-05-04 13:20:37
# @Last Modified by:   Zeyuan Shang
# @Last Modified time: 2016-05-04 13:25:31
from collections import Counter

counter = Counter(raw_input())
for letter, count in sorted(counter.most_common(), key = lambda x: (-x[1], x[0]))[:3]:
	print letter, count