import math

class Complex:
    def __init__(self, real, imag):
        self.real = real
        self.imag = imag
    def __str__(self):
        str = ''
        if self.real != 0:
            str = "%.2f"%self.real;
            if self.imag > 0:
                str += ' + ' + "%.2f"%self.imag + 'i'
            elif self.imag < 0:
                str += ' - ' + "%.2f"%abs(self.imag) + 'i'
        elif self.imag != 0:
            str = "%.2f"%self.imag + 'i'
        else:
            str = "%.2f"%0
        return str
    def __add__(self, c):
        return Complex(self.real + c.real, self.imag + c.imag)
    def __sub__(self, c):
        return Complex(self.real - c.real, self.imag - c.imag)
    def __mul__(self, c):
        return Complex(self.real * c.real - self.imag * c.imag, self.imag * c.real + self.real * c.imag)
    def __div__(self, c):
        cc = self * Complex(c.real, -c.imag)
        return Complex(cc.real / (c.mod() ** 2), cc.imag / (c.mod() ** 2))
    def mod(self):
        return math.sqrt(self.real * self.real + self.imag * self.imag)
    
if __name__ == "__main__":
    a = map(float, raw_input().split())
    b = map(float, raw_input().split())
    ac = Complex(a[0], a[1])
    bc = Complex(b[0], b[1])
    print ac + bc
    print ac - bc
    print ac * bc
    print ac / bc
    print "%.2f"%ac.mod()
    print "%.2f"%bc.mod()