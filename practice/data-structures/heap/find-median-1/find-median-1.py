#!/usr/bin/env python
# -*- coding: utf-8 -*-
# @Author: Zeyuan Shang
# @Date:   2015-12-01 01:05:22
# @Last Modified by:   Zeyuan Shang
# @Last Modified time: 2015-12-01 01:05:37
import heapq

class MedianFinder:
    def __init__(self):
        """
        Initialize your data structure here.
        """
        self.smallHeap = []
        self.largeHeap = []
        

    def addNum(self, num):
        """
        Adds a num into the data structure.
        :type num: int
        :rtype: void
        """
        if len(self.smallHeap) == len(self.largeHeap):
            heapq.heappush(self.largeHeap, -heapq.heappushpop(self.smallHeap, -num))
        else:
            heapq.heappush(self.smallHeap, -heapq.heappushpop(self.largeHeap, num))
        

    def findMedian(self):
        """
        Returns the median of current data stream
        :rtype: float
        """
        if len(self.smallHeap) == len(self.largeHeap):
            return float(self.largeHeap[0] - self.smallHeap[0]) / 2
        else:
            return self.largeHeap[0]
        

if __name__ == "__main__":
    n = int(raw_input())
    mf = MedianFinder()
    for i in range(n):
        mf.addNum(int(raw_input()))
        print mf.findMedian()
        