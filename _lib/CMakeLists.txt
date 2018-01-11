cmake_minimum_required(VERSION 3.6)

project(simd-func)
set(CMAKE_C_STANDARD 99)

add_library(simds STATIC add.c)
target_compile_options(simds PRIVATE -mxsave -mavx2 -mfma -msse4.2 -O3 -mllvm -force-vector-width=4)

