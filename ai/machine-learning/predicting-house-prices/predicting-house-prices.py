from numpy import *

def loadData():
    f, n = map(int, raw_input().split())
    xArr, yArr = [], []
    for i in range(n):
        line = map(float, raw_input().split())
        xArr.append(line[:-1] + [1]) # add bias
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
    t = int(raw_input())
    for i in range(t):
        xxArr = (map(float, raw_input().split())) + [1] # add bias
        yHat = mat(xxArr) * w
        print int(yHat[0][0])

if __name__ == "__main__":
    main()