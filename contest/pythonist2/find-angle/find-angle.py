# -*- coding: utf-8 -*-
# @Author: Zeyuan Shang
# @Date:   2016-05-04 14:13:24
# @Last Modified by:   Zeyuan Shang
# @Last Modified time: 2016-05-04 14:15:11
import cmath
import math

AB = input()
BC = input()
print str(int(round(math.degrees(cmath.phase(complex(BC, AB)))))) + '°'