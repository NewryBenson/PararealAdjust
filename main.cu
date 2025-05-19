#include <iostream>
#include <cuda_runtime.h>

__global__ void ones_CUDA(double *x, size_t N) {
    int idx = blockIdx.x * blockDim.x + threadIdx.x;
    if (idx < N) {
        x[idx] = 1.0;
    }
}

int main() {
    int Ntest = 1;
    double* xtest;

    //reserve shared memory
    cudaMallocManaged(&xtest, Ntest * sizeof(double));

    ones_CUDA<<<(Ntest + 127) / 128, 128>>>(xtest, Ntest);

    //wait for gpu to finish
    cudaDeviceSynchronize();

    if (xtest[0] == 1){std::cout << "GPU runs correctly" << std::endl;};

    //free the reserved memory
    cudaFree(xtest);
    return 0;
}