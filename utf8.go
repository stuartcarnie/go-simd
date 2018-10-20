package simd

import "unicode/utf8"

var (
	validateUTF8fast func([]byte) bool
)

type validateState struct {
	buffer [32]byte
}

func ValidateUTF8Fast(v []byte) bool {
	return validateUTF8fast(v)
}

func validate_utf8_fast_go(v []byte) bool {
	return utf8.Valid(v)
}
