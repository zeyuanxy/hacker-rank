#!/usr/bin/env python
# -*- coding: utf-8 -*-
# @Author: Zeyuan Shang
# @Date:   2016-01-13 16:29:09
# @Last Modified by:   Zeyuan Shang
# @Last Modified time: 2016-01-13 16:29:13
import json
import sys
from sklearn.feature_extraction import DictVectorizer
from sklearn.ensemble import RandomForestClassifier

transformer = DictVectorizer()

def read_train_data():
    trainData = []
    trainLabel = []
    n, m = map(int, raw_input().split())
    for _ in xrange(n):
        data = raw_input().split()
        data.pop(0)
        trainLabel.append(int(data[0]))
        data.pop(0)
        trainData.append({int(x.split(':')[0]) : float(x.split(':')[1]) for x in data for e in x.split(':') })
    trainData = transformer.fit_transform(trainData).toarray()
    return trainData, trainLabel

def read_test_data():
    n = input()
    testData = []
    testName = []
    for _ in xrange(n):
        data = raw_input().split()
        testName.append(data[0])
        data.pop(0)
        testData.append({int(x.split(':')[0]) : float(x.split(':')[1]) for x in data})
    testData = transformer.fit_transform(testData).toarray()
    return testData, testName
    
def main():    
    trainData, trainLabel = read_train_data()
    svm = RandomForestClassifier()
    svm.fit(trainData, trainLabel)
    testData, testName = read_test_data()
    testLabel = svm.predict(testData)
    for x, y in zip(testName, testLabel): 
        print x + ' %+d'%(y)
    
if __name__ == "__main__":
    main()