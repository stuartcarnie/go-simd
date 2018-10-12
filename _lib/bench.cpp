//
// Created by Stuart Carnie on 2018-10-11.
//
#define PICOBENCH_DEBUG
#define PICOBENCH_IMPLEMENT_WITH_MAIN
#include "picobench/picobench.h"

#include "arch.h"
#include <stdio.h>
#include <string.h>
#include <stdlib.h>

#ifdef FOOBAR
#include "decode.c"
#else
extern "C" void FULL_NAME(decode_float64)(unsigned char *b, size_t blen, double *dst, size_t dstlen, int64_t *n);
#endif

static const char * gorilla_0001 = "104087c80000000000c5f7eff9000000000020";
static const char * gorilla_0055 = "104087c80000000000de2deb6f1b9dc37fc05dee1a9de3634f41b84fdc3df9ec9e4911855d29129d84f2ef341883f02a1dc1dbe772a1843d81d7fefcc19bbd71a175c383573e16dfebab0f60ec19849712cdd86bd7022225a9c5f7ee1b000000000020";
static const char * gorilla_1000 = "104087c80000000000de2deb6f1b9dc37fc05dee1a9de3634f41b84fdc3df9ec9e4911855d29129d84f2ef341883f02a1dc1dbe772a1843d81d7fefcc19bbd71a175c383573e16dfebab0f60ec19849712cdd86bd7022225a98337d212c2c8051223bc6b8fd00eec5aa83d13a0943b8c716a06c1b85d0e61dc36bd103ae541d82685b79d7c21e450b337aafb5ef8237dae1438bcf7cef8c2787b14ad1dbdb73066fc5f281778201df2bf100e0bc14bb90de1742c8731fa0dc5286309e104788bf0f613c2482302a3a44885372ef341883f02a1dc1dbe772a1843d81d7fefcc19bbd71a175c383573e16dfebab0f60ec19849712cdd86bd7022225a98337d212c2c8051223bc6b8fd00eec5aa83d13a0943b8c716a06c1b85d0e61dc36bd103ae541d82685b79d7c21e450b337aafb5ef8237dae1438bcf7cef8c2787b14ad1dbdb73066fc5f281778201df2bf100e0bc14bb90de1742c8731fa0dc5286309e104788bf0f613c2482302a3a44885372ef341883f02a1dc1dbe772a1843d81d7fefcc19bbd71a175c383573e16dfebab0f60ec19849712cdd86bd7022225a98337d212c2c8051223bc6b8fd00eec5aa83d13a0943b8c716a06c1b85d0e61dc36bd103ae541d82685b79d7c21e450b337aafb5ef8237dae1438bcf7cef8c2787b14ad1dbdb73066fc5f281778201df2bf100e0bc14bb90de1742c8731fa0dc5286309e104788bf0f613c2482302a3a44885372ef341883f02a1dc1dbe772a1843d81d7fefcc19bbd71a175c383573e16dfebab0f60ec19849712cdd86bd7022225a98337d212c2c8051223bc6b8fd00eec5aa83d13a0943b8c716a06c1b85d0e61dc36bd103ae541d82685b79d7c21e450b337aafb5ef8237dae1438bcf7cef8c2787b14ad1dbdb73066fc5f281778201df2bf100e0bc14bb90de1742c8731fa0dc5286309e104788bf0f613c2482302a3a44885372ef341883f02a1dc1dbe772a1843d81d7fefcc19bbd71a175c383573e16dfebab0f60ec19849712cdd86bd7022225a98337d212c2c8051223bc6b8fd00eec5aa83d13a0943b8c716a06c1b85d0e61dc36bd103ae541d82685b79d7c21e450b337aafb5ef8237dae1438bcf7cef8c2787b14ad1dbdb73066fc5f281778201df2bf100e0bc14bb90de1742c8731fa0dc5286309e104788bf0f613c2482302a3a44885372ef341883f02a1dc1dbe772a1843d81d7fefcc19bbd71a175c383573e16dfebab0f60ec19849712cdd86bd7022225a98337d212c2c8051223bc6b8fd00eec5aa83d13a0943b8c716a06c1b85d0e61dc36bd103ae541d82685b79d7c21e450b337aafb5ef8237dae1438bcf7cef8c2787b14ad1dbdb73066fc5f281778201df2bf100e0bc14bb90de1742c8731fa0dc5286309e104788bf0f613c2482302a3a44885372ef341883f02a1dc1dbe772a1843d81d7fefcc19bbd71a175c383573e16dfebab0f60ec19849712cdd86bd7022225a98337d212c2c8051223bc6b8fd00eec5aa83d13a0943b8c716a06c1b85d0e61dc36bd103ae541d82685b79d7c21e450b337aafb5ef8237dae1438bcf7cef8c2787b14ad1dbdb73066fc5f281778201df2bf100e0bc14bb90de1742c8731fa0dc5286309e104788bf0f613c2482302a3a44885372ef341883f02a1dc1dbe772a1843d81d7fefcc19bbd71a175c383573e16dfebab0f60ec19849712cdd86bd7022225a98337d212c2c8051223bc6b8fd00eec5aa83d13a0943b8c716a06c1b85d0e61dc36bd103ae541d82685b79d7c21e450b337aafb5ef8237dae1438bcf7cef8c2787b14ad1dbdb73066fc5f281778201df2bf100e0bc14bb90de1742c8731fa0dc5286309e104788bf0f613c2482302a3a44885372ef341883f02a1dc1dbe772a1843d81d7fefcc19bbd71a175c38358befdc3000000000004";

int hexchr2bin(const char hex, char *out)
{
   if (out == nullptr)
      return 0;

   if (hex >= '0' && hex <= '9') {
      *out = (char) (hex - '0');
   } else if (hex >= 'A' && hex <= 'F') {
      *out = (char) (hex - 'A' + 10);
   } else if (hex >= 'a' && hex <= 'f') {
      *out = (char) (hex - 'a' + 10);
   } else {
      return 0;
   }

   return 1;
}

size_t hexs2bin(const char *hex, unsigned char **out)
{
   size_t len;
   char   b1;
   char   b2;
   size_t i;

   if (hex == nullptr || *hex == '\0' || out == nullptr)
      return 0;

   len = strlen(hex);
   if (len % 2 != 0)
      return 0;
   len /= 2;

   *out = static_cast<unsigned char *>(malloc(len));
   memset(*out, 'A', len);
   for (i=0; i<len; i++) {
      if (!hexchr2bin(hex[i*2], &b1) || !hexchr2bin(hex[i*2+1], &b2)) {
         return 0;
      }
      (*out)[i] = (unsigned char) ((b1 << 4) | b2);
   }
   return len;
}

void benchmark_decode_1000(picobench::state& s)
{
   unsigned char *buf;
   size_t buflen = hexs2bin(gorilla_1000, &buf);
   double dst[1000];
   int64_t n;

   s.start_timer(); // Manual start
   for (int i=0; i<s.iterations(); ++i)
   {
      FULL_NAME(decode_float64)(buf, buflen, dst, sizeof(dst)/sizeof(dst[0]), &n);
   }
   s.stop_timer(); // Manual stop
}

PICOBENCH(benchmark_decode_1000).iterations({500000});
