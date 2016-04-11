import sys

def ones(x):
    uCount = x - ((x >> 1) & 033333333333) - ((x >> 2) & 011111111111);
    return ((uCount + (uCount >> 3)) & 030707070707) % 63;

def count(x):
    if x >= 0:
        if x == 0:
            return 0
        if x % 2 == 0:
            return count(x - 1) + ones(x)
        return (x + 1) / 2 + 2 * count(x / 2)
    else:
        x += 1
        return 32 * (1 - x) - count(-x)
    
def solve(A, B):
    if A >= 0:
        if A == 0:
            return count(B)
        return count(B) - count(A - 1)
    else:
        if B >= 0:
            return count(A) + count(B)
        return count(A) - count(B + 1)

if __name__ == '__main__':
    T = int(sys.stdin.readline())
    for i in range(T):
        [A, B] = map(int, sys.stdin.readline().split());
        #print count(A), count(B)
        print solve(A, B)
        