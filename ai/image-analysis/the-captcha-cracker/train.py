#!/usr/bin/env python
# -*- coding: utf-8 -*-
# @Author: Zeyuan Shang
# @Date:   2015-12-04 22:04:03
# @Last Modified by:   Zeyuan Shang
# @Last Modified time: 2015-12-04 22:45:58
import os
import numpy as np
import sys

def readImageFile(imgLoc):
    '''
    Reads one image file from imgLoc
    '''
    pixels = []
    with open(imgLoc) as f:
        next(f)
        for line in f:
            row = []
            for p in line.split(" "):
                vals = [int(val) for val in p.split(",")]
                row.append(sum(vals)/len(vals))
            pixels.append(row)
    return np.array(pixels, dtype = np.uint8)

def readData(directory):
    '''
    Reads all captcha files and their labels from directory. directory should have this structure
    as provided by the problem:
    -directory
        -input
            -0.txt
            -1.txt
            -...
        -output
            -0.txt
            -1.txt
            -...
    '''
    images = []
    for root, dirs, files in os.walk(os.path.join(directory, "input"), topdown=False):
        files = [fi for fi in files if fi.endswith(".txt")]
        for name in files:
            try:
                outputfileName =  "output" + str(name[5:].split(".")[0]) + ".txt"
                imgdata = readImageFile(os.path.join(root, name))
                with open(os.path.join(directory, "output", outputfileName)) as outf:
                    output = next(outf).strip()
                images.append((imgdata, output))
            except:
                pass
    return images

def prepareTrainingData(data):
    train_x = []
    train_y = []
    #set a threshold for value to remove the background
    threshold = 100
    for d in data:
        img = d[0]
        output = list(d[1])
        #cut the image into 5 pices !
        startLocX = 7
        endLocX = 21
        startLocY = 6
        increment = 8
        for i in range(5):
            char = img[startLocX:endLocX, startLocY:startLocY + increment]
            #remove the background by thresholding
            #turn the background pixels to white
            char[char > threshold] = 255
            startLocY = startLocY + increment + 1
            train_x.append(char.ravel())
            train_y.append(output[i])
    return (train_x,train_y)

def main():
    #build a model with your favourite classifier !
    from sklearn.linear_model import LogisticRegression

    #read the raw training data
    data = readData(sys.argv[1])
    #prepare the training data from the raw data
    trainingdata =  prepareTrainingData(data)

    #create the classifier
    clf = LogisticRegression()
    clf.fit(trainingdata[0], trainingdata[1])

    #now the classifier can be used to predict any new captcha!

if __name__ == "__main__":
    main()