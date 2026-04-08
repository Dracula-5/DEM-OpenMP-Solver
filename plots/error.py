import numpy as np
import matplotlib.pyplot as plt

data = np.loadtxt("../data/freefall.txt")

t = data[:,0]
z = data[:,1]

z_exact = 1 - 0.5 * 9.81 * t**2
error = np.abs(z - z_exact)

plt.figure()
plt.plot(t, error)

plt.xlabel("Time")
plt.ylabel("Error")

plt.savefig("../results/error.png", dpi=300)
plt.close()
