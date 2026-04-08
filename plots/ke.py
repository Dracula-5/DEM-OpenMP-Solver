import numpy as np
import matplotlib.pyplot as plt

data = np.loadtxt("../data/bounce.txt")

t = data[:,0]
z = data[:,1]

v = np.gradient(z, t)
m = 1.0

KE = 0.5 * m * v**2

plt.figure()
plt.plot(t, KE)

plt.xlabel("Time")
plt.ylabel("Kinetic Energy")

plt.savefig("../results/ke.png", dpi=300)
plt.close()
