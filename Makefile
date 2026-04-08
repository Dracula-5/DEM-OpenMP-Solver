

# Compiler
FC = gfortran

# Flags
CFLAGS = -O2
OMPFLAGS = -fopenmp

# Default target
all: dem dem_parallel

#=======================
# Serial Version
#=======================
dem: src/dem.f90
  $(FC) $(CFLAGS) src/dem.f90 -o dem
#======================
# Parallel Version
#======================
dem_parallel: src/dem_parallel.f90
	$(FC) $(CFLAGS) $(OMPFLAGS) src/dem_parallel.f90 -o dem_parallel

# ==============================
# Run Verification Tests
# ==============================
run_freefall:
	./dem freefall

run_velocity:
	./dem velocity

run_bounce:
	./dem bounce

# ==============================
# Run Parallel Version
# ==============================
run_parallel:
	OMP_NUM_THREADS=4 ./dem_parallel

# ==============================
# Clean Build Files
# ==============================
clean:
	rm -f dem dem_parallel
