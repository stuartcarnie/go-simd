// +build noasm

package ascii

func init() {
	validFn = validate_ascii_go
}
