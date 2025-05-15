#include <iostream>
#include <cuda_runtime.h>

__global__ void ones_CUDA(double *x, size_t N) {
    int idx = blockIdx.x * blockDim.x + threadIdx.x;
    if (idx < N) {
        x[idx] = 1.0;
    }
}

int main() {
    int Ntest = 2;
    double* xtest;

    cudaMallocManaged(&xtest, Ntest * sizeof(double));

    std::cout << "Ones says:" << std::endl;

    ones_CUDA<<<(Ntest + 127) / 128, 128>>>(xtest, Ntest);
    cudaError_t err = cudaGetLastError();
    if (err != cudaSuccess) {
        std::cerr << "Kernel launch failed: " << cudaGetErrorString(err) << std::endl;
    }

    // ✅ Wait for kernel to complete
    cudaDeviceSynchronize();

    // ✅ Check for errors during execution
    err = cudaGetLastError();
    if (err != cudaSuccess) {
        std::cerr << "Kernel execution failed: " << cudaGetErrorString(err) << std::endl;
    }


    for (int i = 0; i < Ntest; ++i) {
        std::cout << xtest[i] << " ";
    }
    std::cout << std::endl;

    cudaFree(xtest);
    return 0;
}