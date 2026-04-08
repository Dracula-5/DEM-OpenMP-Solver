# OpenMP Parallelisation of DEM Solver

## Description
This project implements a 3D Discrete Element Method (DEM) solver and parallelizes it using OpenMP. The solver is verified using standard test cases and performance is analyzed for different particle counts.

## Compilation
```bash
gfortran src/dem_parallel.f90 -O2 -fopenmp -o dem_parallel
