def solve():
    p, d, m, s = map(int, raw_input().split())
    k1 = (p - m) / d
    mm = p - k1 * d
    s1 = (mm + p) * (k1 + 1) / 2
    if s < s1:
        for k in xrange(0, k1):
            if s < p:
                print k
                return
            s -= p
            p -= d
    else:
        s2 = s - s1
        k2 = s2 / m
        k = k1 + 1 + k2
        print k

if __name__ == '__main__':
    solve()
