package simd

import "unsafe"

//go:noescape
func SumFloat64(buf, l, res unsafe.Pointer)

func SumFloat64AVX(buf []float64) float64 {
	var res float64
	SumFloat64(unsafe.Pointer(&buf[0]), unsafe.Pointer(uintptr(len(buf))), unsafe.Pointer(&res))
	return res
}

func SumFloat64Go(buf []float64) float64 {
	acc := float64(0)
	for i := range buf {
		acc += buf[i]
	}
	return acc
}
