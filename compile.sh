#!/bin/bash

### Compile using g++
#g++ ../main.cpp -O3 -fopenmp -o Parareal

### Compile using nvcc
nvcc -arch=sm_80 --cuda-version=12.1 ../main.cu -O3 -o Parareal
