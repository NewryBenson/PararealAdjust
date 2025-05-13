#!/bin/bash

### Compile using nvcc
nvcc ../main.cpp -O3 -fopenmp -o Parareal
