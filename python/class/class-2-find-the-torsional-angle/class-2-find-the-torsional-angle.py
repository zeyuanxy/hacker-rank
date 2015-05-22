import math

class Vector:
    def __init__(self, x, y, z):
        self.x = x
        self.y = y
        self.z = z
    def cross_product(self, v):
        return Vector(self.y * v.z - self.z * v.y, self.z * v.x - self.x * v.z, self.x * v.y - self.y * v.x)
    def dot_product(self, v):
        return self.x * v.x + self.y * v.y + self.z * v.z
    def mod(self):
        return math.sqrt(self.x * self.x + self.y * self.y + self.z * self.z)
    def __sub__(self, v):
        return Vector(self.x - v.x, self.y - v.y, self.z - v.z)
    
if __name__ == "__main__":
    p = []
    for i in range(4):
        s = map(float, raw_input().split())
        p.append(Vector(s[0], s[1], s[2]))
    x = (p[1] - p[0]).cross_product(p[2] - p[1])
    y = (p[2] - p[1]).cross_product(p[3] - p[2])
    print "%.2f"%((math.acos(x.dot_product(y) / (x.mod() * y.mod()))) / math.pi * 180)