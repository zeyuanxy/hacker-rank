import sys

if __name__ == '__main__':
    T = int(sys.stdin.readline())
    for _ in range(T):
        n, p = list(map(int, sys.stdin.readline().split()))
        m, k = n, 1
        # Lucas Theorem
        while m > 0:
            k *= m % p + 1
            m /= p
        print n + 1 - k
