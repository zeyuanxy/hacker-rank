#!/usr/bin/env python
# -*- coding: utf-8 -*-
# @Author: Zeyuan Shang
# @Date:   2016-01-21 23:34:19
# @Last Modified by:   Zeyuan Shang
# @Last Modified time: 2016-01-21 23:34:28
import sys
from collections import OrderedDict

class MapReduce:
    def __init__(self):
        self.intermediate = OrderedDict()
        self.result = []
   

    def emitIntermediate(self, key, value):
        self.intermediate.setdefault(key, [])       
        self.intermediate[key].append(value)

    def emit(self, value):
        self.result.append(value) 

    def execute(self, data, mapper, reducer):
        for record in data:
            mapper(record)

        for key in self.intermediate:
            reducer(key, self.intermediate[key])

        self.result.sort()
        for item in self.result:
            print "{\"key\":\""+item[0]+"\",\"value\":\"" + str(item[1]) + "\"}"

mapReducer = MapReduce()

def mapper(record):
    data = record.split()
    mapReducer.emitIntermediate(data[0], data[1])
    mapReducer.emitIntermediate(data[1], data[0])

def reducer(key, list_of_values):
    mapReducer.emit((key, len(list_of_values)))
    
if __name__ == '__main__':
    inputData = []
    for line in sys.stdin:
        inputData.append(line)
    mapReducer.execute(inputData, mapper, reducer)