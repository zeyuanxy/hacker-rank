# -*- coding: utf-8 -*-
# @Author: Zeyuan Shang
# @Date:   2016-04-14 21:12:40
# @Last Modified by:   Zeyuan Shang
# @Last Modified time: 2016-04-14 21:12:50
import re

if __name__ == "__main__":
    T = input()
    ans = []
    for _ in xrange(T):
        s = raw_input()
        if re.search('^[a-zA-Z0-9\-_]+@[a-zA-Z0-9]+\..{0,3}$', s):
            ans.append(s)
    print sorted(ans)