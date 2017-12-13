package simd

import (
	"github.com/intel-go/cpuid"
)

// True when SIMD instructions are available.
var avx2 = cpuid.HasExtendedFeature(cpuid.AVX2)
var avx = cpuid.HasFeature(cpuid.AVX)
var sse3 = cpuid.HasFeature(cpuid.SSE3)
