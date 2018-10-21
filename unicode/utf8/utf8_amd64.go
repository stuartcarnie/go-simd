// +build !noasm

package utf8

import (
	"github.com/stuartcarnie/go-simd/internal/cpu"
)

func init() {
	if cpu.X86.HasAVX2 {
		validFast = validate_utf8_fast_avx2
	} else if cpu.X86.HasSSE42 {
		validFast = validate_utf8_fast_sse4
	} else {
		validFast = valid_fast_go
	}
}
