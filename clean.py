oldline = ',,,'

with open('rank.csv', 'r') as f:
    for newline in f.readlines():
        if newline.split(',')[2] != oldline.split(',')[2]:
            print(newline.strip())
            oldline = newline
