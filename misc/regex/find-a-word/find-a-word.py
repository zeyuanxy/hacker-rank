import re

if __name__ == "__main__":
    n = int(raw_input())
    s = []
    for i in range(n):
        s.append(raw_input().lower())
    t = int(raw_input())
    for i in range(t):
        w = raw_input()
        ans = 0
        for str in s:
            ans += len(re.findall("(?<!\w)" + w + "(?!\w)", str))
        print ans
