//
// Created by Stuart Carnie on 2018-10-11.
//

#include <cxxabi.h>
#include "arch.h"
#include <memory.h>
#include <stdbool.h>
#include <x86intrin.h>

static inline uint64_t rol(uint64_t v, uint8_t n) {
   n &= 0x3f;
   return (v << n) | (v >> (64 - n));
}

static inline uint64_t ror(uint64_t v, uint8_t n) {
   n &= 0x3f;
   return (v >> n) | (v << (64 - n));
}

static inline uint64_t read_be(const unsigned char *__restrict b) {
   return __builtin_bswap64(*(uint64_t *) b);
}

const uint64_t NAN_EOF = 0x7FF8000000000001;

const uint64_t bitMask[64] = {
   0xffffffffffffffff,
   0x0000000000000001, 0x0000000000000003, 0x0000000000000007, 0x000000000000000f,
   0x000000000000001f, 0x000000000000003f, 0x000000000000007f, 0x00000000000000ff,
   0x00000000000001ff, 0x00000000000003ff, 0x00000000000007ff, 0x0000000000000fff,
   0x0000000000001fff, 0x0000000000003fff, 0x0000000000007fff, 0x000000000000ffff,
   0x000000000001ffff, 0x000000000003ffff, 0x000000000007ffff, 0x00000000000fffff,
   0x00000000001fffff, 0x00000000003fffff, 0x00000000007fffff, 0x0000000000ffffff,
   0x0000000001ffffff, 0x0000000003ffffff, 0x0000000007ffffff, 0x000000000fffffff,
   0x000000001fffffff, 0x000000003fffffff, 0x000000007fffffff, 0x00000000ffffffff,
   0x00000001ffffffff, 0x00000003ffffffff, 0x00000007ffffffff, 0x0000000fffffffff,
   0x0000001fffffffff, 0x0000003fffffffff, 0x0000007fffffffff, 0x000000ffffffffff,
   0x000001ffffffffff, 0x000003ffffffffff, 0x000007ffffffffff, 0x00000fffffffffff,
   0x00001fffffffffff, 0x00003fffffffffff, 0x00007fffffffffff, 0x0000ffffffffffff,
   0x0001ffffffffffff, 0x0003ffffffffffff, 0x0007ffffffffffff, 0x000fffffffffffff,
   0x001fffffffffffff, 0x003fffffffffffff, 0x007fffffffffffff, 0x00ffffffffffffff,
   0x01ffffffffffffff, 0x03ffffffffffffff, 0x07ffffffffffffff, 0x0fffffffffffffff,
   0x1fffffffffffffff, 0x3fffffffffffffff, 0x7fffffffffffffff,
};

#define unlikely(expr) __builtin_expect(!!(expr), 0)
#define likely(expr) __builtin_expect(!!(expr), 1)

#define READER_REFILL() \
   do { \
      size_t len = end - b; \
      if (likely(len >= 8)) { \
         cachedVal = read_be(b); \
         validBits = 64; \
         b += 8; \
      } else if (len > 0) { \
         cachedVal = 0; \
         validBits = (uint8_t)len*8; \
         for (; b < end; ++b) { \
            cachedVal = (cachedVal << 8) | (uint64_t)*b; \
         } \
         cachedVal = ror(cachedVal, validBits); \
      } else { \
         goto ERROR; \
      } \
   } while (0)

#define READER_READ_BIT() \
   ({ \
      validBits--; \
      cachedVal = rol(cachedVal, 1); \
      cachedVal&1; \
   })

#define READER_READ_BITS(n) ({ \
      validBits--; \
      cachedVal = rol(cachedVal, n); \
      cachedVal; \
})

void FULL_NAME(decode_float64)(unsigned char *__restrict b, size_t blen, double *__restrict buf, size_t buflen,
                               int64_t *__restrict n) {
   *n = 0;
   if (blen < 9) {
      return;
   }

   unsigned char *end   = b + blen;

   // first byte is the compression type; always Gorilla
   b++;

   uint64_t val;
   uint8_t  trailingN   = 0;
   uint8_t  meaningfulN = 64;

   val = read_be(b);
   if (val == NAN_EOF) {
      return;
   }
   b += 8;

   uint64_t cachedVal;
   uint8_t  validBits;

   uint64_t *dst = (uint64_t *) buf;
   dst[*n] = val;
   *n += 1;

   READER_REFILL();

   while (1) {
      if (unlikely(validBits == 0))
         READER_REFILL();

      uint64_t bit2 = ({ 1UL; });

      if (likely(READER_READ_BIT())) {
         if (unlikely(validBits == 0))
            READER_REFILL();

         if (likely(READER_READ_BIT())) {
            // read 5 bits for leading zero count and 6 bits for the meaningful data count
            const uint8_t leadingTrailingBitCount = 11;
            uint64_t      lmBits;
            if (likely(validBits >= leadingTrailingBitCount)) {
               lmBits = READER_READ_BITS(leadingTrailingBitCount);
            } else {
               uint8_t bits01 = 11;
               if (likely(validBits > 0)) {
                  bits01 -= validBits;
                  lmBits = rol(cachedVal, 11);
               } else {
                  lmBits = 0;
               }

               READER_REFILL();

               lmBits &= ~bitMask[bits01 & 0x3f];
               lmBits |= READER_READ_BITS(bits01) & bitMask[bits01 & 0x3f];
            }
            lmBits &= 0x7ff;

            uint8_t leadingN = (uint8_t) ((lmBits >> 6) & 0x1f);
            meaningfulN = (uint8_t) (lmBits & 0x3f);
            if (likely(meaningfulN > 0)) {
               trailingN = (uint8_t) (64 - leadingN - meaningfulN);
            } else {
               trailingN   = 0;
               meaningfulN = 64;
            }
         }

         uint64_t sBits;
         if (validBits >= meaningfulN) {
            sBits = READER_READ_BITS(meaningfulN);
         } else {
            uint8_t mBits = meaningfulN;
            if (likely(validBits > 0)) {
               mBits -= validBits;
               sBits = rol(cachedVal, meaningfulN);
            } else {
               sBits = 0;
            }

            READER_REFILL();

            sBits &= ~bitMask[mBits & 0x3f];
            sBits |= READER_READ_BITS(mBits) & bitMask[mBits & 0x3f];
         }
         sBits &= bitMask[meaningfulN & 0x3f];

         val ^= sBits << trailingN;
         if (unlikely(val == NAN_EOF)) {
            break;
         }
      }

      if (unlikely(*n >= buflen)) {
         goto ERROR;
      }

      dst[*n] = val;
      *n += 1;
   }

   return;

   ERROR:
   *n = 0;
}

