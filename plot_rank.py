from datetime import datetime as dt
import matplotlib.pyplot as plt
import os


def read_data(username):
    with open(f'ranks/{username}.csv') as f:
        logs = [log.strip() for log in f.readlines()][1:]
    timestamps = [dt.fromtimestamp(int(log.split(',')[1])) for log in logs]
    ranks = [int(log.split(',')[2]) for log in logs]
    return timestamps, ranks


fig, ax = plt.subplots()

for username in [f.split('.')[0] for f in os.listdir('ranks')]:
    x, y = read_data(username)
    ax.plot(x, y)

plt.show()
