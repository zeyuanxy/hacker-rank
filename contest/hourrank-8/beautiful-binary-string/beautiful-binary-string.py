# -*- coding: utf-8 -*-
# @Author: Zeyuan Shang
# @Date:   2016-05-03 00:32:24
# @Last Modified by:   Zeyuan Shang
# @Last Modified time: 2016-05-03 00:35:00
import re

if __name__ == "__main__":
	raw_input()
	s = raw_input()
	print len(re.findall('010', s))