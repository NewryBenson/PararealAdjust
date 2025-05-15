#!/bin/bash

### Compile using g++
#g++ ../main.cpp -O3 -fopenmp -o Parareal

### Compile using nvcc
nvcc -arch=sm_80 ../main.cpp -O3 -o Parareal
