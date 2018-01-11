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
BenchmarkSumFloat64AVX-8   	 5000000	       255 ns/op	31276.62 MB/s
BenchmarkSumFloat64b-8     	20000000	        84.4 ns/op	94735.93 MB/s
BenchmarkSumFloat64Go-8    	 1000000	      1150 ns/op	6956.41 MB/s
```

`SumFloat64b` is just a simple C-loop, letting the compiler auto-vectorize.