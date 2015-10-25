from collections import defaultdict

if __name__ == "__main__":
    d = defaultdict(list)
    n, m = map(int, raw_input().split())
    for i in range(n):
        word = raw_input()
        d[word].append(i + 1)
    for i in range(m):
        word = raw_input()
        if word in d:
            print ' '.join(map(str, d[word]))
        else:
            print -1