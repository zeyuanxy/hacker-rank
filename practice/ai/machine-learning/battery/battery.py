from numpy import *

def loadData():
    xArr, yArr = [], []
    for i in open('trainingdata.txt'):
        line = map(float, i.split(','))
        if line[0] < 4:
            xArr.append(line[:-1])
            yArr.append(line[-1])
    return xArr, yArr

def lineReg(xArr, yArr):
    xMat = mat(xArr); yMat = mat(yArr).T
        xTx = xMat.T * xMat
        if linalg.det(xTx) == 0.0:
            print "this matrix is singular, cannot do inverse"
                return
        w = xTx.I * (xMat.T * yMat)
    return w

def main():
    xArr, yArr = loadData()
    w = lineReg(xArr, yArr)
    x = float(raw_input())
    if x < 4:
        xxArr = [x]
        yHat = (mat(xxArr) * w)[0][0]
        print '%.2f' % yHat
    else:
        print 8.00

if __name__ == "__main__":
    main()
