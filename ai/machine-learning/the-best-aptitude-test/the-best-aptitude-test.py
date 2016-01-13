#!/usr/bin/env python
# -*- coding: utf-8 -*-
# @Author: Zeyuan Shang
# @Date:   2016-01-13 15:36:10
# @Last Modified by:   Zeyuan Shang
# @Last Modified time: 2016-01-13 15:36:14
import numpy as np

def calc(gpas):
    scores = map(float, raw_input().split())
    coef = np.corrcoef(gpas, scores)[0, 1]
    return 0 if np.isnan(coef) else coef
    
def main():
    T = input()
    for _ in xrange(T):
        raw_input()
        gpas = map(float, raw_input().split())
        m = max([calc(gpas), i] for i in xrange(1, 6))[1]
        print m

if __name__ == "__main__":
    main()