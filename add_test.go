package simd

import (
	"github.com/stretchr/testify/assert"
	"testing"
)

func TestSumFloat64AVX(t *testing.T) {
	buf := makeBuffer(10000)
	res := SumFloat64AVX(buf)
	assert.Equal(t, res, float64(49995000.0))
}

func TestSumFloat64b(t *testing.T) {
	buf := makeBuffer(10000)
	res := SumFloat64b(buf)
	assert.Equal(t, res, float64(49995000.0))
}

func TestSumFloat64Go(t *testing.T) {
	buf := makeBuffer(10000)
	res := SumFloat64Go(buf)
	assert.Equal(t, res, float64(49995000.0))
}

func makeBuffer(l int) []float64 {
	buf := make([]float64, l)
	for i := range buf {
		buf[i] = float64(i)
	}
	return buf
}

func BenchmarkSumFloat64AVX_1000(b *testing.B) {
	benchmarkSumFloat64AVX(b, 1000)
}

func BenchmarkSumFloat64AVX_10000(b *testing.B) {
	benchmarkSumFloat64AVX(b, 10000)
}

func benchmarkSumFloat64AVX(b *testing.B, n int) {
	buf := makeBuffer(n)
	b.SetBytes(int64(len(buf) * 8))
	for i := 0; i < b.N; i++ {
		SumFloat64AVX(buf)
	}
}

func BenchmarkSumFloat64b_1000(b *testing.B) {
	benchmarkSumFloat64b(b, 1000)
}

func BenchmarkSumFloat64b_10000(b *testing.B) {
	benchmarkSumFloat64b(b, 10000)
}

func benchmarkSumFloat64b(b *testing.B, n int) {
	buf := makeBuffer(n)
	b.SetBytes(int64(len(buf) * 8))
	for i := 0; i < b.N; i++ {
		SumFloat64b(buf)
	}
}

func BenchmarkSumFloat64Go_1000(b *testing.B) {
	benchmarkSumFloat64Go(b, 1000)
}

func BenchmarkSumFloat64Go_10000(b *testing.B) {
	benchmarkSumFloat64Go(b, 10000)
}

func benchmarkSumFloat64Go(b *testing.B, n int) {
	buf := makeBuffer(n)
	b.SetBytes(int64(len(buf) * 8))
	for i := 0; i < b.N; i++ {
		SumFloat64Go(buf)
	}
}
