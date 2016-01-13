#!/usr/bin/env python
# -*- coding: utf-8 -*-
# @Author: Zeyuan Shang
# @Date:   2016-01-13 14:50:43
# @Last Modified by:   Zeyuan Shang
# @Last Modified time: 2016-01-13 15:12:39

# Usefull reading:
# http://stackoverflow.com/questions/1989992/predict-stock-market-values

import numpy as np
import math

def read_data():
    m, k, d = map(float, raw_input().strip().split())
    k, d = int(k), int(d)

    names, owned, prices = [], [], []
    for data in xrange(k):
        line = raw_input().strip().split()
        names.append(line[0])
        owned.append(int(line[1]))
        prices.append([float(i) for i in line[2:]])

    return m, k, d, names, owned, prices

def stochastic_oscillator(prices, period):
    min_p = prices[-period:].min()
    max_p = prices[-period:].max()

    if min_p == max_p:
        return 0.

    return abs(100. * (prices[-1] - min_p) / (max_p - min_p))

def print_transactions(m, k, d, names, owned, prices):
    output = []

    prices = np.array(prices)
    deviations = prices.std(1)

    to_buy = []
    for i in reversed(np.argsort(deviations)):
        sa = stochastic_oscillator(prices[i], 3)

        if sa >= 80. and owned[i]:
            output.append('{} {} {}'.format(names[i], 'SELL', owned[i]))
        elif sa <= 20. and m:
            to_buy.append((i, sa, prices[i][-1]))

    for i, sa, price in to_buy:
        num = int(m / int(math.ceil(price)))
        if num:
            output.append('{} {} {}'.format(names[i], 'BUY', num))
            m -= num * int(math.ceil(price))

    return output

def main():
    m, k, d, names, owned, prices = read_data()
    output = print_transactions(m, k, d, names, owned, prices)

    print len(output)
    for line in output:
        print line

if __name__ == "__main__":
    main()