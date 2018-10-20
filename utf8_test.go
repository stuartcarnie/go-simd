// +build !noasm

package simd

import (
	"math/rand"
	"testing"
	"unicode/utf8"

	"github.com/stretchr/testify/assert"
)

func makeASCII(n int) []byte {
	data := make([]byte, n)
	for i := range data {
		data[i] = byte(rand.Uint32() & 0xff)
	}
	return data
}

func makeUTF8(n int) []byte {
	data := make([]byte, n+3)
	i := 0

	for i < n {
		w := byte(rand.Uint32() & 0xff)
		if w < 0x80 {
			data[i] = 0x20
			i++
		} else if w < 0xE0 {
			data[i] = byte(0xC2 + rand.Uint32()%(0xDF-0xC2+1))
			i++
			data[i] = byte(0x80 + rand.Uint32()%(0xBF-0x80+1))
			i++
		} else if w == 0xE0 {
			data[i] = w
			i++
			data[i] = byte(0xA0 + rand.Uint32()%(0xBF-0xA0+1))
			i++
			data[i] = byte(0x80 + rand.Uint32()%(0xBF-0x80+1))
			i++
		} else if w <= 0xEC {
			data[i] = w
			i++
			data[i] = byte(0x80 + rand.Uint32()%(0xBF-0x80+1))
			i++
			data[i] = byte(0x80 + rand.Uint32()%(0xBF-0x80+1))
			i++
		} else if w == 0xED {
			data[i] = w
			i++
			data[i] = byte(0x80 + rand.Uint32()%(0x9F-0x80+1))
			i++
			data[i] = byte(0x80 + rand.Uint32()%(0xBF-0x80+1))
			i++
		} else if w <= 0xEF {
			data[i] = w
			i++
			data[i] = byte(0x80 + rand.Uint32()%(0xBF-0x80+1))
			i++
			data[i] = byte(0x80 + rand.Uint32()%(0xBF-0x80+1))
			i++
		} else if w < 0xF0 {
			data[i] = byte(0xF1 + rand.Uint32()%(0xF3-0xF1+1))
			i++
			data[i] = byte(0x80 + rand.Uint32()%(0xBF-0x80+1))
			i++
			data[i] = byte(0x80 + rand.Uint32()%(0xBF-0x80+1))
			i++
			data[i] = byte(0x80 + rand.Uint32()%(0xBF-0x80+1))
			i++
		} else if w == 0xF0 {
			data[i] = w
			i++
			data[i] = byte(0x90 + rand.Uint32()%(0xBF-0x90+1))
			i++
			data[i] = byte(0x80 + rand.Uint32()%(0xBF-0x80+1))
			i++
			data[i] = byte(0x80 + rand.Uint32()%(0xBF-0x80+1))
			i++
		} else if w <= 0xF3 {
			data[i] = byte(0xF1 + rand.Uint32()%(0xF3-0xF1+1))
			i++
			data[i] = byte(0x80 + rand.Uint32()%(0xBF-0x80+1))
			i++
			data[i] = byte(0x80 + rand.Uint32()%(0xBF-0x80+1))
			i++
			data[i] = byte(0x80 + rand.Uint32()%(0xBF-0x80+1))
			i++
		} else if w == 0xF4 {
			data[i] = w
			i++
			data[i] = byte(0x80 + rand.Uint32()%(0x8F-0x80+1))
			i++
			data[i] = byte(0x80 + rand.Uint32()%(0xBF-0x80+1))
			i++
			data[i] = byte(0x80 + rand.Uint32()%(0xBF-0x80+1))
			i++
		}
	}
	return data[:i]
}

func TestValidateUTF8Fast(t *testing.T) {
	buf := makeUTF8(10)
	res := ValidateUTF8Fast(buf)
	exp := utf8.Valid(buf)
	assert.Equal(t, exp, res)
}

func BenchmarkValidateUTF8Fast_Go_1000(b *testing.B) {
	benchmarkValidateUTF8FastFn(b, 1000, utf8.Valid)
}

func BenchmarkValidateUTF8Fast_Go_10000(b *testing.B) {
	benchmarkValidateUTF8FastFn(b, 10000, utf8.Valid)
}

func BenchmarkValidateUTF8Fast_SSE4_1000(b *testing.B) {
	benchmarkValidateUTF8FastFn(b, 1000, validate_utf8_fast_sse4)
}

func BenchmarkValidateUTF8Fast_SSE4_10000(b *testing.B) {
	benchmarkValidateUTF8FastFn(b, 10000, validate_utf8_fast_sse4)
}

func BenchmarkValidateUTF8Fast_AVX2_1000(b *testing.B) {
	benchmarkValidateUTF8FastFn(b, 1000, validate_utf8_fast_avx2)
}

func BenchmarkValidateUTF8Fast_AVX2_10000(b *testing.B) {
	benchmarkValidateUTF8FastFn(b, 10000, validate_utf8_fast_avx2)
}

func benchmarkValidateUTF8FastFn(b *testing.B, n int, fn func([]byte) bool) {
	buf := makeUTF8(n)
	b.SetBytes(int64(len(buf)))
	for i := 0; i < b.N; i++ {
		fn(buf)
	}
}
