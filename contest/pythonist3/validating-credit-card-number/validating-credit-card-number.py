# -*- coding: utf-8 -*-
# @Author: Zeyuan Shang
# @Date:   2016-05-13 12:50:43
# @Last Modified by:   Zeyuan Shang
# @Last Modified time: 2016-05-13 12:50:54
import re
for i in range(int(raw_input())):
    S = raw_input().strip()
    pre_match = re.search(r'^[456]\d{3}(-?)\d{4}\1\d{4}\1\d{4}$',S)
    if pre_match:
        processed_string = "".join(pre_match.group(0).split('-'))
        final_match = re.search(r'(\d)\1{3,}',processed_string)
        print 'Invalid' if final_match else 'Valid'
    else:
        print 'Invalid'