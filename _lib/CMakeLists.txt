cmake_minimum_required(VERSION 3.6)

project(simd-func)
set(CMAKE_C_STANDARD 99)
set(CMAKE_CXX_STANDARD 11)

add_library(simds STATIC sum.c decode.c)
target_compile_options(simds PRIVATE -mxsave -mavx2 -mfma -msse4.2 -O3 -mllvm -force-vector-width=4)

add_executable(simd decode.c main.c)
add_executable(bench bench.cpp decode.c)