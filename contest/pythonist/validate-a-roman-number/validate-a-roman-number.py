# -*- coding: utf-8 -*-
# @Author: Zeyuan Shang
# @Date:   2016-04-14 21:02:15
# @Last Modified by:   Zeyuan Shang
# @Last Modified time: 2016-04-14 21:02:24
def generate_roman_number(i):
    ret = ''
    ret += 'M' * (i / 1000)
    ret += ['', 'C', 'CC', 'CCC', 'CD', 'D', 'DC', 'DCC', 'DCCC', 'CM'][i / 100 % 10]
    ret += ['','X','XX','XXX','XL','L','LX','LXX','LXXX','XC'][i / 10 % 10]
    ret += ['','I','II','III','IV','V','VI','VII','VIII','IX'][i % 10]
    return ret

if __name__ == "__main__":
    s = set(map(generate_roman_number, range(1, 4000)))
    print 'True' if raw_input().rstrip() in s else 'False'