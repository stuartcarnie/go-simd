// +build !noasm

package ascii

import "unsafe"

//go:noescape
func __validate_ascii_fast_sse4(buf, len, res unsafe.Pointer)

func validate_ascii_fast_sse4(v []byte) bool {
	if len(v) == 0 {
		return true
	}

	var (
		res uint64
	)
	__validate_ascii_fast_sse4(unsafe.Pointer(&v[0]), unsafe.Pointer(uintptr(len(v))), unsafe.Pointer(&res))
	return res != 0
}
