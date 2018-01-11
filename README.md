SIMD Experiments
================


Benchmarks
----------

### SumFloat64

Benchmark various sum implementations `[1000]float64`. 

* `SumFloat64AVX` uses AVX intrinsics via clang
* `SumFloat64b` use a standard C loop and enables auto-vectorization for AVX
* `SumFloat64Go` is an equivalent loop in Go

```
BenchmarkSumFloat64AVX_1000-8    	 5000000	       260 ns/op	30675.32 MB/s
BenchmarkSumFloat64AVX_10000-8   	  500000	      3015 ns/op	26529.54 MB/s
BenchmarkSumFloat64b_1000-8      	20000000	      88.6 ns/op	90307.32 MB/s
BenchmarkSumFloat64b_10000-8     	 2000000	       856 ns/op	93395.87 MB/s
BenchmarkSumFloat64Go_1000-8     	 1000000	      1215 ns/op	6580.11 MB/s
BenchmarkSumFloat64Go_10000-8    	  100000	     12243 ns/op	6534.24 MB/s
```

`SumFloat64b` is just a simple C-loop, letting the compiler auto-vectorize.