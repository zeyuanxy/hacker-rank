import numpy as np
from sklearn.preprocessing import PolynomialFeatures
from sklearn import linear_model

if __name__ == "__main__":
    (f, n) = map(int, raw_input().split())
    x = []
    y = []
    poly = PolynomialFeatures(degree = 4)
    for i in range(n):
        v = map(float, raw_input().split())
        x.append(poly.fit_transform(v[:-1])[0])
        y.append(v[-1])
        
    clf = linear_model.BayesianRidge()
    clf.fit(x, y)
    
    tc = int(raw_input())
    for i in range(tc):
        v = map(float, raw_input().split())
        print clf.predict(poly.transform(v))[0]
    