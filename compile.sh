#!/bin/bash

### Compile using nvcc
nvcc -x cu ../main.cpp -O3 -o Parareal