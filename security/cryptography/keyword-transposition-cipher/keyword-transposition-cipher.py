# Reference from bhajunsingh
import collections, itertools, string, sys

def chunks(s, n):
    return [s[i : i + n] for i in range(0, len(s), n)]

def substitution(key, alphabet):
    key = list(collections.OrderedDict.fromkeys(key))
    sub = [list(key)] + chunks([x for x in alphabet if x not in key], len(key))
    sub = sorted(''.join(x) for x in itertools.zip_longest(*sub, fillvalue = ''))
    return ''.join(sub)

if __name__ == '__main__':
    alphabet = string.ascii_uppercase
    N = int(sys.stdin.readline())
    for _ in range(N):
        key = sys.stdin.readline().strip()
        cipher = sys.stdin.readline().strip()
        sub = substitution(key, alphabet)
        print(cipher.translate(str.maketrans(sub, alphabet)))