SIMD Experiments
================


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
