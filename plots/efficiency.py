import matplotlib.pyplot as plt

threads = [1,2,4,8]

eff_1000 = [1, 0.32, 0.11, 0.02]

plt.plot(threads, eff_1000, marker='o')
plt.xlabel("Threads")
plt.ylabel("Efficiency")
plt.title("Efficiency (N=1000)")
plt.savefig("../results/efficiency_1000.png", dpi=300)
plt.close()
