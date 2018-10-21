package ascii

var (
	validFn func([]byte) bool
)

// Valid reports whether p consists entirely of valid UTF-8-encoded runes.
func Valid(p []byte) bool {
	return validFn(p)
}

func validate_ascii_go(v []byte) bool {
	for _, i := range v {
		if i <= 127 {
			continue
		}
		return false
	}
	return true
}
