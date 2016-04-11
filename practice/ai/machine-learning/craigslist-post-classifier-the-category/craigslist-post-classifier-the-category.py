#!/usr/bin/env python
# -*- coding: utf-8 -*-
# @Author: Zeyuan Shang
# @Date:   2016-01-13 17:28:21
# @Last Modified by:   Zeyuan Shang
# @Last Modified time: 2016-01-13 17:52:30
import json
import sys
from sklearn.feature_extraction import DictVectorizer
from sklearn.svm import LinearSVC

transformer = DictVectorizer()

def read_train_data():
    f = open('training.json')
    n = int(f.readline())
    trainData = []
    trainLabel = []
    for _ in xrange(n):
        data = json.loads(f.readline())
        trainLabel.append(data['category'])
        del data['category']
        trainData.append(data)
    f.close()
    trainData = transformer.fit_transform(trainData)
    return trainData, trainLabel

def read_test_data():
    n = input()
    testData = []
    for _ in xrange(n):
        data = json.loads(raw_input())
        testData.append(data)
    testData = transformer.transform(testData)
    return testData
    
def main():    
    trainData, trainLabel = read_train_data()
    svm = LinearSVC()
    svm.fit(trainData, trainLabel)
    testData = read_test_data()
    testLabel = svm.predict(testData)
    for e in testLabel: 
        print e
    
if __name__ == "__main__":
    main()