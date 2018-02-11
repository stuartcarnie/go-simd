// +build !noasm

package simd

import "unsafe"

//go:noescape
func _sum_float64_sse4(buf, len, res unsafe.Pointer)

func sum_float64_sse4(buf []float64) (res float64) {
	_sum_float64_sse4(unsafe.Pointer(&buf[0]), unsafe.Pointer(uintptr(len(buf))), unsafe.Pointer(&res))
	return
}
