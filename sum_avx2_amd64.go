// +build !noasm

package simd

import "unsafe"

//go:noescape
func _sum_float64_avx_intrinsics(buf, len, res unsafe.Pointer)

func sum_float64_avx_intrinsics(buf []float64) (res float64) {
	_sum_float64_avx_intrinsics(unsafe.Pointer(&buf[0]), unsafe.Pointer(uintptr(len(buf))), unsafe.Pointer(&res))
	return
}

//go:noescape
func _sum_float64_avx2(buf, len, res unsafe.Pointer)

func sum_float64_avx2(buf []float64) (res float64) {
	_sum_float64_avx2(unsafe.Pointer(&buf[0]), unsafe.Pointer(uintptr(len(buf))), unsafe.Pointer(&res))
	return
}
