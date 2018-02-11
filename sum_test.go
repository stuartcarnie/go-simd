// +build !noasm

package simd

import (
	"testing"

	"github.com/stretchr/testify/assert"
)

func TestSumFloat64(t *testing.T) {
	buf := makeBuffer(10000)
	res := SumFloat64(buf)
	assert.Equal(t, res, float64(49995000.0))
}

func makeBuffer(l int) []float64 {
	buf := make([]float64, l)
	for i := range buf {
		buf[i] = float64(i)
	}
	return buf
}

func BenchmarkSumFloat64_1000(b *testing.B) {
	benchmarkSumFloat64Fn(b, 1000, SumFloat64)
}

func BenchmarkSumFloat64_10000(b *testing.B) {
	benchmarkSumFloat64Fn(b, 10000, SumFloat64)
}

func BenchmarkSumFloat64_Intrinsics_1000(b *testing.B) {
	benchmarkSumFloat64Fn(b, 1000, sum_float64_avx_intrinsics)
}

func BenchmarkSumFloat64_Intrinsics_10000(b *testing.B) {
	benchmarkSumFloat64Fn(b, 10000, sum_float64_avx_intrinsics)
}

func BenchmarkSumFloat64_AVX2_1000(b *testing.B) {
	benchmarkSumFloat64Fn(b, 1000, sum_float64_avx2)
}

func BenchmarkSumFloat64_AVX2_10000(b *testing.B) {
	benchmarkSumFloat64Fn(b, 10000, sum_float64_avx2)
}

func BenchmarkSumFloat64_SSE4_1000(b *testing.B) {
	benchmarkSumFloat64Fn(b, 1000, sum_float64_sse4)
}

func BenchmarkSumFloat64_SSE4_10000(b *testing.B) {
	benchmarkSumFloat64Fn(b, 10000, sum_float64_sse4)
}

func BenchmarkSumFloat64_Go_1000(b *testing.B) {
	benchmarkSumFloat64Fn(b, 1000, sum_float64_go)
}

func BenchmarkSumFloat64_Go_10000(b *testing.B) {
	benchmarkSumFloat64Fn(b, 10000, sum_float64_go)
}

func BenchmarkSumFloat64_GoUnroll4_1000(b *testing.B) {
	benchmarkSumFloat64Fn(b, 1000, sum_float64_go_unroll4)
}

func BenchmarkSumFloat64_GoUnroll4_10000(b *testing.B) {
	benchmarkSumFloat64Fn(b, 10000, sum_float64_go_unroll4)
}

func BenchmarkSumFloat64_GoUnroll8_1000(b *testing.B) {
	benchmarkSumFloat64Fn(b, 1000, sum_float64_go_unroll8)
}

func BenchmarkSumFloat64_GoUnroll8_10000(b *testing.B) {
	benchmarkSumFloat64Fn(b, 10000, sum_float64_go_unroll8)
}

func benchmarkSumFloat64Fn(b *testing.B, n int, fn func([]float64) float64) {
	buf := makeBuffer(n)
	b.SetBytes(int64(len(buf) * 8))
	for i := 0; i < b.N; i++ {
		fn(buf)
	}
}
