// +build !noasm

package utf8

import (
	"fmt"
	"math/rand"
	"testing"
	"unicode/utf8"

	"github.com/stretchr/testify/assert"
)

func makeASCII(n int) []byte {
	data := make([]byte, n)
	for i := range data {
		data[i] = byte(rand.Uint32() & 0x7f)
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
	res := Valid(buf)
	exp := utf8.Valid(buf)
	assert.Equal(t, exp, res)
}

type ValidTest struct {
	in  string
	exp bool
}

var validTests = []ValidTest{
	{"", true},
	{"a", true},
	{"abc", true},
	{"Ж", true},
	{"ЖЖ", true},
	{"брэд-ЛГТМ", true},
	{"☺☻☹", true},
	{"aa\xe2", false},
	{string([]byte{66, 250}), false},
	{string([]byte{66, 250, 67}), false},
	{"a\uFFFDb", true},
	{string("\xF4\x8F\xBF\xBF"), true},      // U+10FFFF
	{string("\xF4\x90\x80\x80"), false},     // U+10FFFF+1; exp of range
	{string("\xF7\xBF\xBF\xBF"), false},     // 0x1FFFFF; exp of range
	{string("\xFB\xBF\xBF\xBF\xBF"), false}, // 0x3FFFFFF; exp of range
	{string("\xc0\x80"), false},             // U+0000 encoded in two bytes: incorrect
	{string("\xed\xa0\x80"), false},         // U+D800 high surrogate (sic)
	{string("\xed\xbf\xbf"), false},         // U+DFFF low surrogate (sic)
}

func TestValid(t *testing.T) {
	fnCases := []struct {
		n  string
		fn func([]byte) bool
	}{
		{"validate_utf8_fast_sse4", validate_utf8_fast_sse4},
		{"validate_utf8_fast_avx2", validate_utf8_fast_avx2},
	}

	for _, fn := range fnCases {
		for _, tc := range validTests {
			t.Run(fmt.Sprintf("%s(%q)", fn.n, tc.in), func(t *testing.T) {
				got := fn.fn([]byte(tc.in))
				if got != tc.exp {
					t.Errorf("%s(%q) = %v; want %v", fn.n, tc.in, got, tc.exp)
				}
			})
		}
	}
}

func BenchmarkValid(b *testing.B) {
	benchmarks := []struct {
		name    string
		validFN func([]byte) bool
	}{
		{
			name:    "utf8.Valid",
			validFN: utf8.Valid,
		},
		{
			name:    "sse4.Valid",
			validFN: validate_utf8_fast_sse4,
		},
		{
			name:    "avx2.Valid",
			validFN: validate_utf8_fast_avx2,
		},
	}
	for _, bm := range benchmarks {
		b.Run(bm.name, func(b *testing.B) {
			for name, dataFN := range map[string]func(int) []byte{"ASCII": makeASCII, "UTF8": makeUTF8} {
				b.Run(name, func(b *testing.B) {
					for _, n := range []int{100, 10000, 1000000} {
						buf := dataFN(n)
						b.Run(fmt.Sprintf("%d", n), func(b *testing.B) {
							b.SetBytes(int64(len(buf)))
							for i := 0; i < b.N; i++ {
								bm.validFN(buf)
							}
						})
					}
				})
			}
		})
	}
}
