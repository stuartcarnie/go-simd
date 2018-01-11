package simd

import (
	"github.com/stretchr/testify/assert"
	"testing"
)

func TestSumFloat64AVX(t *testing.T) {
	buf := makeBuffer(1000)
	res := SumFloat64AVX(buf)
	assert.Equal(t, res, float64(499500.0))
}

func TestSumFloat64b(t *testing.T) {
	buf := makeBuffer(1000)
	res := SumFloat64b(buf)
	assert.Equal(t, res, float64(499500.0))
}

func TestSumFloat64Go(t *testing.T) {
	buf := makeBuffer(1000)
	res := SumFloat64Go(buf)
	assert.Equal(t, res, float64(499500.0))
}

func makeBuffer(l int) []float64 {
	buf := make([]float64, l)
	for i := range buf {
		buf[i] = float64(i)
	}
	return buf
}

func BenchmarkSumFloat64AVX(b *testing.B) {
	buf := makeBuffer(1000)
	b.SetBytes(int64(len(buf) * 8))

	for i := 0; i < b.N; i++ {
		SumFloat64AVX(buf)
	}
}

func BenchmarkSumFloat64b(b *testing.B) {
	buf := makeBuffer(1000)
	b.SetBytes(int64(len(buf) * 8))

	for i := 0; i < b.N; i++ {
		SumFloat64b(buf)
	}
}

func BenchmarkSumFloat64Go(b *testing.B) {
	buf := makeBuffer(1000)
	b.SetBytes(int64(len(buf) * 8))

	for i := 0; i < b.N; i++ {
		SumFloat64Go(buf)
	}
}
