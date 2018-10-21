package utf8

import "unicode/utf8"

var (
	validFast func([]byte) bool
)

type validateState struct {
	buffer [32]byte
}

// Valid reports whether p consists entirely of valid UTF-8-encoded runes.
func Valid(p []byte) bool {
	return validFast(p)
}

func valid_fast_go(v []byte) bool {
	return utf8.Valid(v)
}
