SIMD Experiments
================


Benchmarks
----------

```
BenchmarkSumFloat64AVX-8   	 5000000	       255 ns/op	31276.62 MB/s
BenchmarkSumFloat64b-8     	20000000	        84.4 ns/op	94735.93 MB/s
BenchmarkSumFloat64Go-8    	 1000000	      1150 ns/op	6956.41 MB/s
```

`SumFloat64b` is just a simple C-loop, letting the compiler auto-vectorize.