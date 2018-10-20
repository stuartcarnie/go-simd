// +build noasm

package simd

func init() {
	validateUTF8fast = validate_utf8_fast_go
}
