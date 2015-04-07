if __name__ == "__main__":
    data = raw_input().strip(',\n').split(' ')
    count = 0
    total = 0
    for pxl in data:
        pxl = pxl.split(',')
        mean = 0
        for i in pxl:
            mean += int(i)
        mean /= 3
        if mean < 70:
            count += 1
        total += 1
    if float(count) / total > 0.4:
        print 'night'
    else:
        print 'day'
