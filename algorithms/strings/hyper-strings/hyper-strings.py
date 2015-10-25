slist = []

def check(str, sub):
    if sub == "":
        return False
    global slist
    for i in slist:
        if i == sub and str != sub:
            return True
        x = sub.startswith(i)
        if x == True:
            if check(str, sub[len(i):]) == True:
                return True
    return False      

if __name__ == '__main__':
    N, M = map(int, raw_input().split())
    global slist
    for i in range(N):
        slist.append(raw_input())
    tmp = []
    for i in slist:
        if check(i, i) == False:
            tmp.append(i)
    slist = tmp
    dp = [0] * (M + 1)
    dp[0] = 1
    ans = 1
    for i in range(1, M + 1):
        for j in slist:
            if i >= len(j):
                dp[i] += dp[i - len(j)]
        ans += dp[i]
    print ans % 1000000007
        

