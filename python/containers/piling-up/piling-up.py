from collections import deque

if __name__ == "__main__":
    T = int(raw_input())
    for _ in xrange(T):
        n = int(raw_input())
        sl = deque(map(int, raw_input().split()))
        ans = []
        while len(sl) > 0:
            if sl[0] >= sl[-1]:
                ans.append(sl[0])
                sl.popleft()
            else:
                ans.append(sl[-1])
                sl.pop()
        if all(ans[i] >= ans[i + 1] for i in xrange(len(ans) - 1)):
            print 'Yes'
        else:
            print 'No'