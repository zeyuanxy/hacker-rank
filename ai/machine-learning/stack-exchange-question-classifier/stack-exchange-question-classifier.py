#!/usr/bin/env python
# -*- coding: utf-8 -*-
# @Author: Zeyuan Shang
# @Date:   2016-01-13 16:08:21
# @Last Modified by:   Zeyuan Shang
# @Last Modified time: 2016-01-13 16:24:51
import json
import sys
from sklearn.feature_extraction.text import HashingVectorizer
from sklearn.svm import LinearSVC

transformer = HashingVectorizer(stop_words='english')

def read_train_data():
    f = open('training.json')
    n = int(f.readline())
    trainData = []
    trainLabel = []
    for _ in xrange(n):
        data = json.loads(f.readline())
        trainData.append(data['question'] + '\r\n' + data['excerpt'])
        trainLabel.append(data['topic'])
    f.close()
    trainData = transformer.fit_transform(trainData)
    return trainData, trainLabel

def read_test_data():
    n = input()
    testData = []
    for _ in xrange(n):
        data = json.loads(raw_input())
        testData.append(data['question'] + '\r\n' + data['excerpt'])
    testData = transformer.fit_transform(testData)
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