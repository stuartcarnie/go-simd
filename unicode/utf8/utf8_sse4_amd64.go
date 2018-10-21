// +build !noasm

package utf8

import "unsafe"

//go:noescape
func __validate_utf8_fast_sse4(state, buf, len, res unsafe.Pointer)

func validate_utf8_fast_sse4(v []byte) bool {
	if len(v) == 0 {
		return true
	}

	var (
		state validateState
		res   uint64
	)
	__validate_utf8_fast_sse4(unsafe.Pointer(&state), unsafe.Pointer(&v[0]), unsafe.Pointer(uintptr(len(v))), unsafe.Pointer(&res))
	return res != 0
}
