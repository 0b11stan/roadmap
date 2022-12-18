from datetime import datetime as dt
import matplotlib.pyplot as plt


def read_data():
    with open('rank.csv') as f:
        logs = [log.strip() for log in f.readlines()][1:]
    timestamps = [dt.fromtimestamp(int(log.split(',')[1])) for log in logs]
    ranks = [int(log.split(',')[2]) for log in logs]
    return timestamps, ranks


x, y = read_data()
fig, ax = plt.subplots()
ax.plot(x, y)
plt.show()
