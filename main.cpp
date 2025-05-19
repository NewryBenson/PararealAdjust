#include <iostream>
#include <cuda_runtime.h>

#include "Kernels_CUDA_Cpp.hpp"

int main() {
    int Ntest = 1;
    double* xtest;
    bool GPU = 1;
    std::cout << "Sanity1" << std::endl;
    LeXInt::ones(xtest, Ntest, GPU);
    std::cout << "Sanity8" << std::endl;
    if (xtest[0] == 1){std::cout << "GPU runs correctly" << std::endl;};
    std::cout << "Sanity9" << std::endl;

    return 0;
}