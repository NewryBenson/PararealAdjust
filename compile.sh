#!/bin/bash

### Compile using g++
#g++ ../main.cpp -O3 -fopenmp -o Parareal

### Compile using nvcc
nvcc ../main.cu -O3 -o Parareal
