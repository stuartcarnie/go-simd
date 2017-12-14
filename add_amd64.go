package simd

import "unsafe"

//go:noescape
func __SumFloat64(buf, len, res unsafe.Pointer)

func SumFloat64AVX(buf []float64) float64 {
	var res float64
	__SumFloat64(unsafe.Pointer(&buf[0]), unsafe.Pointer(uintptr(len(buf))), unsafe.Pointer(&res))
	return res
}

func SumFloat64Go(buf []float64) float64 {
	acc := float64(0)
	for i := range buf {
		acc += buf[i]
	}
	return acc
}
