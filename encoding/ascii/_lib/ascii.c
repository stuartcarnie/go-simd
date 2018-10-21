#include "arch.h"
#include "simdasciicheck.h"

void FULL_NAME(validate_ascii_fast)(const char *buf, size_t len, size_t *res) {
#if __AVX2__
    *res = validate_ascii_fast_avx(buf, len);
#elif __SSE__
    *res = validate_ascii_fast(buf, len);
#endif
}