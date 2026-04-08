import numpy as np
import matplotlib.pyplot as plt

data = np.loadtxt("../data/bounce.txt")

t = data[:,0]
z = data[:,1]

plt.figure()
plt.plot(t, z)

plt.xlabel("Time")
plt.ylabel("Height")

plt.savefig("../results/bounce.png", dpi=300)
plt.close()
