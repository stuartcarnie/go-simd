#include "arch.h"
#include "simdutf8check.h"

void FULL_NAME(validate_utf8_fast)(state *state, const char *buf, size_t len, size_t *res) {
#if __AVX2__
    *res = validate_utf8_fast_avx_asciipath(state, buf, len);
#elif __SSE__
    *res = validate_utf8_fast(state, buf, len);
#endif
}