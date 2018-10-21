package utf8

import "unicode/utf8"

var (
	validFn func([]byte) bool
)

type validateState struct {
	buffer [32]byte
}

// Valid reports whether p consists entirely of valid UTF-8-encoded runes.
func Valid(p []byte) bool {
	return validFn(p)
}

func validate_utf8_go(v []byte) bool {
	return utf8.Valid(v)
}
