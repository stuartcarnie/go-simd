#include "arch.h"
#include <memory.h>

#ifdef __AVX__

#include "immintrin.h"

void sum_float64_avx_intrinsics(double buf[], size_t len, double *res) {
    if (len % 4 != 0) {
        return;
    }

    __m256d acc = _mm256_set1_pd(0);
    for (int i = 0; i < len; i += 4) {
        __m256d v = _mm256_load_pd(&buf[i]);
        acc = _mm256_add_pd(acc, v);
    }

    acc = _mm256_hadd_pd(acc, acc); // a[0] = a[0] + a[1], a[2] = a[2] + a[3]
    *res = _mm256_cvtsd_f64(acc) + _mm_cvtsd_f64(_mm256_extractf128_pd(acc, 1));
}
#endif

void FULL_NAME(sum_float64)(double buf[], int len, double *res) {
    double acc = 0.0;
    for(int i = 0; i < len; i++) {
        acc += buf[i];
    }
    *res = acc;
}