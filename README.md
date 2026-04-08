# OpenMP Parallelisation of a DEM Solver

## 📌 Overview

This project implements a Discrete Element Method (DEM) solver to simulate particle motion and interactions. The solver is parallelised using OpenMP and evaluated for performance across different particle sizes and thread counts.

---

## ⚙️ Features

* DEM solver implementation (Fortran)
* Verification using:

  * Free fall
  * Constant velocity
  * Bounce test
* OpenMP parallelisation
* Performance analysis (speedup & efficiency)
* Plot generation using Python

---

## 📂 Project Structure

```
DEM_OpenMP/
├── src/        # Fortran source code
├── data/       # Simulation outputs
├── results/    # Plots (PNG)
├── plots/      # Python scripts
├── report/     # PDF + LaTeX report
├── README.md
```

---

## 🛠️ Compilation

### Serial Version

```
gfortran src/dem.f90 -O2 -o dem
```

### Parallel Version

```
gfortran src/dem_parallel.f90 -O2 -fopenmp -o dem_parallel
```

---

## ▶️ Running

### Verification

```
./dem freefall
./dem velocity
./dem bounce
```

### Parallel Execution

```
export OMP_NUM_THREADS=4
./dem_parallel
```

---

## 📊 Plot Generation

```
python plots/freefall.py
python plots/error.py
python plots/bounce.py
python plots/velocity.py
python plots/ke.py
```

---

## 📈 Performance Metrics

Speedup:
S(p) = T1 / Tp

Efficiency:
E(p) = S(p) / p

---

## ⚠️ Key Observations

* DEM complexity is O(N²)
* Contact loop dominates (~90–95% runtime)
* Parallelisation introduces overhead
* No speedup observed for tested sizes due to atomic operations and synchronization

---

## 🚀 Future Work

* Neighbour search (cell lists)
* Domain decomposition
* Reduce synchronization overhead

---

## 📄 Report

The full report is available in:

```
report/HPSC.pdf
```

---

## 👤 Author

Dheeraj Reddy
HPSC Course — April 2026
