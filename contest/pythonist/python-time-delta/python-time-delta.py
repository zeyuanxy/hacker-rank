# -*- coding: utf-8 -*-
# @Author: Zeyuan Shang
# @Date:   2016-04-11 22:58:12
# @Last Modified by:   Zeyuan Shang
# @Last Modified time: 2016-04-11 22:58:18
from datetime import datetime

if __name__ == "__main__":
    T = int(input())
    pattern = '%a %d %b %Y %H:%M:%S %z'
    for _ in range(T):
        s = datetime.strptime(input(), pattern).timestamp()                
        t = datetime.strptime(input(), pattern).timestamp()
        print(int(abs(s - t)))