# -*- coding: utf-8 -*-
# @Author: Zeyuan Shang
# @Date:   2016-05-13 12:35:11
# @Last Modified by:   Zeyuan Shang
# @Last Modified time: 2016-05-13 12:35:16
from itertools import groupby

s = raw_input()
for k, g in groupby(s):
    print '({}, {})'.format(len(list(g)), k),