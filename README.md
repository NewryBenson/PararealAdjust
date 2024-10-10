# Parareal

1. Install Parareal
``` shell
git clone https://github.com/Pranab-JD/Parareal.git
```
2. Create build directory
``` shell
cd Parareal && mkdir build && cd build
```
3. Compile the code
``` shell
bash ../compile.sh
```
4. Run the code
``` shell
./Parareal 8 0.5 1e-10 16 "RK4" "yes"
```

### Info on input arguments:
Argument 1: The executable (program) to be run (./Parareal) <br />
Argument 2: Grid points along X & Y (e.g., 8 --> 2^8 x 2^8) <br />
Argument 3: Time step size in terms of n_cfl x dt_cfl (e.g., 0.5 --> 0.5 * dt_cfl; dt_cfl is computed in main.cpp) <br />
Argument 4: Tolerance, for iterative methods (e.g., 1e-10) <br />
Argument 5: Number of time steps (e.g., 16) <br />
Argument 6: Desired integrator (e.g., "RK4")  <br />
Argument 7: Write data to files every N time steps for movies (if "yes", will create files & write data) <br />