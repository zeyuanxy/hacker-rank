#!/usr/bin/env python
# -*- coding: utf-8 -*-
# @Author: Zeyuan Shang
# @Date:   2016-01-21 23:52:37
# @Last Modified by:   Zeyuan Shang
# @Last Modified time: 2016-01-21 23:52:49
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
            print item

mapReducer = MapReduce()

def mapper(record):
    data = record.strip().split(',')
    if data[0] == 'Employee':
        mapReducer.emitIntermediate(data[2], '$' + data[1])
    else:
        mapReducer.emitIntermediate(data[1], data[2])

def reducer(key, list_of_values):
    data = sorted(list_of_values)
    name = data[0][1:]
    for department in data[1:]:
        mapReducer.emit((key, name, department))
            
if __name__ == '__main__':
    inputData = []
    for line in sys.stdin:
        inputData.append(line)
    mapReducer.execute(inputData, mapper, reducer)
