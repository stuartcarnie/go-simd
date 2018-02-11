// +build !noasm

package simd

import (
	"github.com/influxdata/simd/internal/cpu"
)

func init() {
	if cpu.X86.HasAVX2 {
		sumFloat64 = sum_float64_avx2
	} else if cpu.X86.HasSSE42 {
		sumFloat64 = sum_float64_sse4
	} else {
		sumFloat64 = sum_float64_go
	}
}
