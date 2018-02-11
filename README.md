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
BenchmarkSumFloat64_1000-8               	30000000	        56.0 ns/op	142967.78 MB/s
BenchmarkSumFloat64_10000-8              	 2000000	       843 ns/op	94804.04 MB/s
BenchmarkSumFloat64_Intrinsics_1000-8    	 5000000	       244 ns/op	32659.28 MB/s
BenchmarkSumFloat64_Intrinsics_10000-8   	  500000	      2862 ns/op	27951.00 MB/s
BenchmarkSumFloat64_AVX2_1000-8          	30000000	        53.6 ns/op	149380.83 MB/s
BenchmarkSumFloat64_AVX2_10000-8         	 2000000	       811 ns/op	98540.07 MB/s
BenchmarkSumFloat64_SSE4_1000-8          	10000000	       203 ns/op	39260.83 MB/s
BenchmarkSumFloat64_SSE4_10000-8         	 1000000	      2160 ns/op	37022.06 MB/s
BenchmarkSumFloat64_Go_1000-8            	 1000000	      1118 ns/op	7150.71 MB/s
BenchmarkSumFloat64_Go_10000-8           	  200000	     11508 ns/op	6951.17 MB/s
BenchmarkSumFloat64_GoUnroll4_1000-8     	 5000000	       287 ns/op	27853.79 MB/s
BenchmarkSumFloat64_GoUnroll4_10000-8    	  500000	      2911 ns/op	27475.60 MB/s
BenchmarkSumFloat64_GoUnroll8_1000-8     	10000000	       188 ns/op	42341.22 MB/s
BenchmarkSumFloat64_GoUnroll8_10000-8    	  500000	      2885 ns/op	27727.23 MB/s
```

`SumFloat64b` is just a simple C-loop, letting the compiler auto-vectorize.