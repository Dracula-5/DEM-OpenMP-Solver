import matplotlib.pyplot as plt

threads = [1,2,4,8]

# N = 1000
speedup_1000 = [1, 0.64, 0.43, 0.15]

plt.plot(threads, speedup_1000, marker='o')
plt.xlabel("Threads")
plt.ylabel("Speedup")
plt.title("Speedup (N=1000)")
plt.savefig("../results/speedup_1000.png", dpi=300)
plt.close()
