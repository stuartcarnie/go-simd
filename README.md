go-simd
=======

Make certain functions Go faster with SIMD, loop unrolling or other optimization techniques.

This packages chooses the most appropriate implementation at runtime, based on the host CPU features. 


Benchmarks
----------

### SumFloat64

Benchmark various sum implementations, aggregating 1000 and 10000 element slices of `float64` values. 

* `Intrinsics` uses handwritten AVX intrinsics via clang
* `AVX2` uses plain C code, exploiting auto-vectorization and AVX2 architecture enabled via clang 
* `SSE4` uses plain C code, exploiting auto-vectorization and SSE4 architecture enabled via clang 
* `Go` is an equivalent loop in Go
    * `Unroll4` and `Unroll8` are unrolled versions

```
BenchmarkSumFloat64_1000-8               	20000000	        59.7 ns/op	134057.61 MB/s
BenchmarkSumFloat64_10000-8              	 2000000	       842 ns/op	94949.30 MB/s
BenchmarkSumFloat64_Intrinsics_1000-8    	 5000000	       245 ns/op	32550.11 MB/s
BenchmarkSumFloat64_Intrinsics_10000-8   	  500000	      2913 ns/op	27460.17 MB/s
BenchmarkSumFloat64_AVX2_1000-8          	30000000	        56.2 ns/op	142336.45 MB/s
BenchmarkSumFloat64_AVX2_10000-8         	 2000000	       847 ns/op	94426.99 MB/s
BenchmarkSumFloat64_SSE4_1000-8          	 5000000	       277 ns/op	28806.44 MB/s
BenchmarkSumFloat64_SSE4_10000-8         	  500000	      2903 ns/op	27556.33 MB/s
BenchmarkSumFloat64_Go_1000-8            	 1000000	      1124 ns/op	7116.81 MB/s
BenchmarkSumFloat64_Go_10000-8           	  200000	     11583 ns/op	6906.38 MB/s
BenchmarkSumFloat64_GoUnroll4_1000-8     	 5000000	       287 ns/op	27790.03 MB/s
BenchmarkSumFloat64_GoUnroll4_10000-8    	  500000	      2896 ns/op	27616.44 MB/s
BenchmarkSumFloat64_GoUnroll8_1000-8     	10000000	       188 ns/op	42341.91 MB/s
BenchmarkSumFloat64_GoUnroll8_10000-8    	  500000	      2924 ns/op	27358.12 MB/s
```

### unicode/utf8.Valid

Provide a fast implementation of `utf8.Valid` using SSE and AVX2 functions. Credit for these SIMD implementations go to 
Daniel Lemire.

Read [this post](https://lemire.me/blog/2018/10/19/validating-utf-8-bytes-using-only-0-45-cycles-per-byte-avx-edition/)
for more information on these SIMD optimized functions.


```
BenchmarkValidateUTF8Fast_Go_1000-8      	 1000000	      1374 ns/op	 727.68 MB/s
BenchmarkValidateUTF8Fast_Go_10000-8     	   50000	     32323 ns/op	 309.40 MB/s
BenchmarkValidateUTF8Fast_SSE4_1000-8    	 5000000	       264 ns/op	3782.58 MB/s
BenchmarkValidateUTF8Fast_SSE4_10000-8   	  500000	      2416 ns/op	4138.13 MB/s
BenchmarkValidateUTF8Fast_AVX2_1000-8    	10000000	       154 ns/op	6489.45 MB/s
BenchmarkValidateUTF8Fast_AVX2_10000-8   	 1000000	      1370 ns/op	7299.13 MB/s
```