from collections import Counter

for letter, counts in sorted(Counter(raw_input()).most_common(), key = lambda x: (-x[1], x[0]))[:3]:
    print letter, counts