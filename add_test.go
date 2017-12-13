package simd

import "testing"

func TestSumFloat64AVX(t *testing.T) {
	buf := makeBuffer(1000)
	res := SumFloat64AVX(buf)
	t.Log(res)
}

func TestSumFloat64Go(t *testing.T) {
	buf := makeBuffer(1000)
	res := SumFloat64Go(buf)
	t.Log(res)
}

func makeBuffer(l int) []float64 {
	buf := make([]float64, l)
	for i := range buf {
		buf[i] = 1
	}
	return buf
}

func BenchmarkSumFloat64P(b *testing.B) {
	buf := makeBuffer(1000)
	b.SetBytes(int64(len(buf) * 8))

	for i := 0; i < b.N; i++ {
		SumFloat64AVX(buf)
	}
}

func BenchmarkSumFloat64Go(b *testing.B) {
	buf := makeBuffer(1000)
	b.SetBytes(int64(len(buf) * 8))

	for i := 0; i < b.N; i++ {
		SumFloat64Go(buf)
	}
}


