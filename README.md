# OpenMP Parallelisation of a DEM Solver

## 📌 Overview

This project implements a Discrete Element Method (DEM) solver to simulate particle motion and interactions. The solver is parallelised using OpenMP and evaluated for performance across different particle sizes and thread counts.

---

## ⚙️ Features

* DEM solver implemented in Fortran
* Verification using:

  * Free fall test
  * Constant velocity test
  * Bounce test
* OpenMP parallelisation
* Performance analysis (speedup & efficiency)
* Visualization using Python

---

## 📂 Project Structure

```
DEM-OpenMP-Solver/
├── src/        # Fortran source code
├── data/       # Simulation outputs
├── results/    # Generated plots
├── plots/      # Python plotting scripts
├── report/     # Final report (PDF + LaTeX)
├── Makefile
├── README.md
```

---

## 🛠️ Build Instructions (Makefile)

### Compile all

```
make
```

### Compile individually

```
make dem
make dem_parallel
```

---

## ▶️ Running Simulations

### Verification tests

```
make run_freefall
make run_velocity
make run_bounce
```

### Parallel execution

```
make run_parallel
```

Or manually:

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

* DEM has O(N²) computational complexity
* Contact loop dominates (~90–95% runtime)
* Parallelisation introduces overhead
* No speedup observed for tested problem sizes due to atomic operations and synchronization

---

## 🚀 Future Work

* Neighbour search (cell lists)
* Domain decomposition
* Reducing synchronization overhead

---

## 📄 Report

The complete report is available at:

```
report/HPSC.pdf
```

---

## 👤 Author

**Dheeraj Reddy**
HPSC Course — April 2026
