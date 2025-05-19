#include <iostream>
#include <cuda_runtime.h>

#include "Kernels.hpp"
#include "Kernels_CUDA_Cpp.hpp"

int main() {
    int Ntest = 1;
    double* xtest;
    bool GPU = 1;

    LeXInt::ones(xtest, Ntest, GPU)

    if (xtest[0] == 1){std::cout << "GPU runs correctly" << std::endl;};

    return 0;
}