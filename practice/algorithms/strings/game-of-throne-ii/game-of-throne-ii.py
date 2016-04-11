from collections import Counter

MOD = 10**9 + 7

def factMod(x):
    ret = 1
    for i in range(1, x):
        ret = (ret * (i + 1)) % MOD;
    return ret

def powMod(x, y):
    if y == 0:
        return 1
    if y == 1:
        return x % MOD
    temp = powMod(x, y / 2)
    if y % 2 == 0:
        return (temp * temp) % MOD
    else:
        return (x * temp * temp) % MOD

if __name__ == '__main__':
    word = raw_input()
    counter = Counter(word)
    denominator = 1
    numerator = 0
    for i in counter:
        numerator += counter[i] / 2
        denominator = (denominator * factMod(counter[i] / 2)) % MOD
    answer = (factMod(numerator) * powMod(denominator, MOD - 2)) % MOD
    print answer
    
    
