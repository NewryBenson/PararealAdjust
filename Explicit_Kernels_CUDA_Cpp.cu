#pragma once

#include <iostream>

//? ----------------------------------------------------------
//?
//? Description:
//?     Kernels and functions are "unified" for proper usage
//?     depending on whether GPU support is activated or not. 
//?
//? ----------------------------------------------------------
#include "Explicit.hpp"
#include "Kernels.cu"
#include "functions.hpp"
#include "Explicit_Kernels.cu"


namespace LeXInt
{
    template <typename rhs>
    void explicit_Euler(rhs RHS, double* u, double* u_sol, double* u_temp, double dt, size_t N, bool GPU)
    {
        if (GPU)
        {
            #ifdef __CUDACC__
            
            //* CUDA
            explicit_Euler_CUDA<<<(N/128) + 1, 128>>>(u, u_sol, u_temp, dt, N);

            #else
            std::cout << "Error: Compiled with GCC, not NVCC." << std::endl;
            exit(1);
            #endif
        }
        else
        {
            // CPU version
            explicit_Euler_Cpp(RHS, u, u_sol, u_temp, dt, N);
        }
    }

    template <typename rhs>
    void RK2(rhs RHS, double* u, double* u_sol, double* u_temp, double dt, size_t N, bool GPU)
    {
        if (GPU)
        {
            #ifdef __CUDACC__
            
            //* CUDA
            RK2_CUDA<<<(N/128) + 1, 128>>>(u, u_sol, u_temp, dt, N);

            #else
            std::cout << "Error: Compiled with GCC, not NVCC." << std::endl;
            exit(1);
            #endif
        }
        else
        {
            // CPU version
            RK2_Cpp(RHS, u, u_sol, u_temp, dt, N);
        }
    }

    template <typename rhs>
    void RK4(rhs RHS, double* u, double* u_sol, double* u_temp, double dt, size_t N, bool GPU)
    {
        if (GPU)
        {
            #ifdef __CUDACC__
            
            //* CUDA
            RK4_CUDA<<<(N/128) + 1, 128>>>(u, u_sol, u_temp, dt, N);

            #else
            std::cout << "Error: Compiled with GCC, not NVCC." << std::endl;
            exit(1);
            #endif
        }
        else
        {
            // CPU version
            RK4_Cpp(RHS, u, u_sol, u_temp, dt, N);
        }
    }

}