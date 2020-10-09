go-simd
=======

Make certain functions Go faster with SIMD, loop unrolling, c2goasm or other optimization techniques.

This package chooses the most appropriate implementation at runtime, based on the host CPU features, however,
it is possible to disable certain implementations using the  `INTEL_DISABLE_EXT` environment variable.
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
BenchmarkSumFloat64_1000-8                   20000000          59 ns/op    134057.61 MB/s
BenchmarkSumFloat64_10000-8                   2000000         842 ns/op     94949.30 MB/s
BenchmarkSumFloat64_Intrinsics_1000-8         5000000         245 ns/op     32550.11 MB/s
BenchmarkSumFloat64_Intrinsics_10000-8         500000        2913 ns/op     27460.17 MB/s
BenchmarkSumFloat64_AVX2_1000-8              30000000          56 ns/op    142336.45 MB/s
BenchmarkSumFloat64_AVX2_10000-8              2000000         847 ns/op     94426.99 MB/s
BenchmarkSumFloat64_SSE4_1000-8               5000000         277 ns/op     28806.44 MB/s
BenchmarkSumFloat64_SSE4_10000-8               500000        2903 ns/op     27556.33 MB/s
BenchmarkSumFloat64_Go_1000-8                 1000000        1124 ns/op      7116.81 MB/s
BenchmarkSumFloat64_Go_10000-8                 200000       11583 ns/op      6906.38 MB/s
BenchmarkSumFloat64_GoUnroll4_1000-8          5000000         287 ns/op     27790.03 MB/s
BenchmarkSumFloat64_GoUnroll4_10000-8          500000        2896 ns/op     27616.44 MB/s
BenchmarkSumFloat64_GoUnroll8_1000-8         10000000         188 ns/op     42341.91 MB/s
BenchmarkSumFloat64_GoUnroll8_10000-8          500000        2924 ns/op     27358.12 MB/s
```

### unicode/utf8.Valid

Provide a fast implementation of `utf8.Valid` using SSE and AVX2 functions. Credit for these SIMD implementations go to 
Daniel Lemire.

Read [this post](https://lemire.me/blog/2018/10/19/validating-utf-8-bytes-using-only-0-45-cycles-per-byte-avx-edition/)
for more information on these SIMD optimized functions.


```
BenchmarkValid/utf8.Valid/ASCII/100-8          20000000            79 ns/op    1257.68 MB/s
BenchmarkValid/utf8.Valid/ASCII/10000-8          200000          6140 ns/op    1628.48 MB/s
BenchmarkValid/utf8.Valid/ASCII/1000000-8          2000        608369 ns/op    1643.74 MB/s
BenchmarkValid/utf8.Valid/UTF8/100-8           10000000           139 ns/op     724.09 MB/s
BenchmarkValid/utf8.Valid/UTF8/10000-8            50000         32722 ns/op     305.60 MB/s
BenchmarkValid/utf8.Valid/UTF8/1000000-8            500       3953426 ns/op     252.95 MB/s
BenchmarkValid/sse4.Valid/UTF8/100-8           30000000            43 ns/op    2311.65 MB/s
BenchmarkValid/sse4.Valid/UTF8/10000-8           500000          2436 ns/op    4104.65 MB/s
BenchmarkValid/sse4.Valid/UTF8/1000000-8          10000        243250 ns/op    4110.98 MB/s
BenchmarkValid/sse4.Valid/ASCII/100-8          30000000            43 ns/op    2294.62 MB/s
BenchmarkValid/sse4.Valid/ASCII/10000-8          500000          2439 ns/op    4099.68 MB/s
BenchmarkValid/sse4.Valid/ASCII/1000000-8          5000        246138 ns/op    4062.75 MB/s
BenchmarkValid/avx2.Valid/ASCII/100-8          50000000            24 ns/op    4042.96 MB/s
BenchmarkValid/avx2.Valid/ASCII/10000-8         5000000           256 ns/op   39043.62 MB/s
BenchmarkValid/avx2.Valid/ASCII/1000000-8         50000         30786 ns/op   32481.66 MB/s
BenchmarkValid/avx2.Valid/UTF8/100-8           50000000            35 ns/op    2864.81 MB/s
BenchmarkValid/avx2.Valid/UTF8/10000-8          1000000          1440 ns/op    6943.45 MB/s
BenchmarkValid/avx2.Valid/UTF8/1000000-8          10000        142939 ns/op    6995.97 MB/s
```


### encoding/ascii.Valid

A fast implementation for determining if a buffer is valid ASCII data. Credit for SIMD implementations go
to Daniel Lemire.

```
BenchmarkValid/go.Valid/100-8         20000000          52 ns/op     1911.59 MB/s
BenchmarkValid/go.Valid/10000-8         500000        3048 ns/op     3280.27 MB/s
BenchmarkValid/go.Valid/1000000-8         5000      303508 ns/op     3294.80 MB/s
BenchmarkValid/sse4.Valid/100-8      100000000          11 ns/op     8674.49 MB/s
BenchmarkValid/sse4.Valid/10000-8      5000000         379 ns/op    26379.43 MB/s
BenchmarkValid/sse4.Valid/1000000-8      50000       37061 ns/op    26982.04 MB/s
BenchmarkValid/avx2.Valid/100-8      200000000           8 ns/op    12437.12 MB/s
BenchmarkValid/avx2.Valid/10000-8     10000000         137 ns/op    72718.12 MB/s
BenchmarkValid/avx2.Valid/1000000-8     100000       17767 ns/op    56280.99 MB/s
``` 



## Reference

- John Keiser, Daniel Lemire, [Validating UTF-8 In Less Than One Instruction Per Byte](https://arxiv.org/abs/2010.03090), Software: Practice & Experience (to appear)

