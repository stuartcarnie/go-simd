// +build !noasm

package simd

import (
	"github.com/stuartcarnie/go-simd/internal/cpu"
)

func init() {
	if cpu.X86.HasAVX2 {
		validateUTF8fast = validate_utf8_fast_avx2
	} else if cpu.X86.HasSSE42 {
		validateUTF8fast = validate_utf8_fast_sse4
	} else {
		validateUTF8fast = validate_utf8_fast_go
	}
}
