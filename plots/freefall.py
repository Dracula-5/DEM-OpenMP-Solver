import numpy as np
import matplotlib.pyplot as plt

data = np.loadtxt("../data/freefall.txt")

t = data[:,0]
z_num = data[:,1]

z_exact = 1 - 0.5 * 9.81 * t**2

plt.figure()
plt.plot(t, z_num, 'r.', label="Numerical")
plt.plot(t, z_exact, 'b-', label="Analytical")

plt.xlabel("Time")
plt.ylabel("Height")
plt.legend()

plt.savefig("../results/freefall.png", dpi=300)
plt.close()
