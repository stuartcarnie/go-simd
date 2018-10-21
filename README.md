go-simd
=======

Make certain functions Go faster with SIMD, loop unrolling or other optimization techniques.

This packages chooses the most appropriate implementation at runtime, based on the host CPU features, however,
it is possible to configure this at runtime using the `INTEL_DISABLE_EXT` environment variable.
See the [cpu package README](https://github.com/stuartcarnie/go-simd/blob/master/internal/cpu/README.md) for 
a description of this environment variable.


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
BenchmarkValid/utf8.Valid/ASCII/100-8         	20000000	        80.9 ns/op	1236.14 MB/s
BenchmarkValid/utf8.Valid/ASCII/10000-8       	  200000	      6211 ns/op	1609.93 MB/s
BenchmarkValid/utf8.Valid/ASCII/1000000-8     	    2000	    623638 ns/op	1603.49 MB/s
BenchmarkValid/utf8.Valid/UTF8/100-8          	10000000	       142 ns/op	 710.35 MB/s
BenchmarkValid/utf8.Valid/UTF8/10000-8        	   50000	     33008 ns/op	 302.96 MB/s
BenchmarkValid/utf8.Valid/UTF8/1000000-8      	     300	   4093794 ns/op	 244.27 MB/s
BenchmarkValid/validate_utf8_fast_sse4/ASCII/100-8     	30000000	        44.0 ns/op	2272.78 MB/s
BenchmarkValid/validate_utf8_fast_sse4/ASCII/10000-8   	  500000	      2500 ns/op	3999.59 MB/s
BenchmarkValid/validate_utf8_fast_sse4/ASCII/1000000-8 	   10000	    255361 ns/op	3916.01 MB/s
BenchmarkValid/validate_utf8_fast_sse4/UTF8/100-8      	30000000	        46.0 ns/op	2175.00 MB/s
BenchmarkValid/validate_utf8_fast_sse4/UTF8/10000-8    	  500000	      2446 ns/op	4087.57 MB/s
BenchmarkValid/validate_utf8_fast_sse4/UTF8/1000000-8  	    5000	    249482 ns/op	4008.30 MB/s
BenchmarkValid/validate_utf8_fast_avx2/ASCII/100-8     	50000000	        25.0 ns/op	4000.31 MB/s
BenchmarkValid/validate_utf8_fast_avx2/ASCII/10000-8   	 5000000	       257 ns/op	38904.57 MB/s
BenchmarkValid/validate_utf8_fast_avx2/ASCII/1000000-8 	   50000	     31137 ns/op	32115.88 MB/s
BenchmarkValid/validate_utf8_fast_avx2/UTF8/100-8      	50000000	        35.8 ns/op	2821.18 MB/s
BenchmarkValid/validate_utf8_fast_avx2/UTF8/10000-8    	 1000000	      1438 ns/op	6952.24 MB/s
BenchmarkValid/validate_utf8_fast_avx2/UTF8/1000000-8  	   10000	    143426 ns/op	6972.20 MB/s
```