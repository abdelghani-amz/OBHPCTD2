//
#if defined(__INTEL_COMPILER)
#include <mkl.h>
#else
#include <cblas.h>
#endif

//
#include "types.h"

//Baseline - naive implementation
f64 reduc_base(f64 *restrict a, u64 n)
{
  double d = 0.0;
  
  for (u64 i = 0; i < n; i++)
    d += a[i];

  return d;
}

f64 reduc_unroll4(f64 *restrict a, u64 n)
{
  double d = 0.0;
  
  #define UNROLL4 4
  for (u64 i = 0; i < (n - (n & (UNROLL4 - 1))); i += UNROLL4){
    d += a[i];
    d += a[i + 1];
    d += a[i + 2];
    d += a[i + 3];
  }

  for (u64 i = (n - (n & (UNROLL4 - 1))); i < n; i++)
    d += a[i];
  return d;
}


f64 reduc_unroll8(f64 *restrict a, u64 n)
{
  double d = 0.0;
  
  #define UNROLL8 8
  for (u64 i = 0; i < (n - (n & (UNROLL8 - 1))); i += UNROLL8){
    d += a[i];
    d += a[i + 1];
    d += a[i + 2];
    d += a[i + 3];
    d += a[i + 4];
    d += a[i + 5];
    d += a[i + 6];
    d += a[i + 7];
  }

  for (u64 i = (n - (n & (UNROLL8 - 1))); i < n; i++)
    d += a[i];
  return d;
}

f64 reduc_cblas(f64 *restrict a, u64 n){
  f64 _b = 1 ;
  return cblas_ddot(n, a, 1, &_b, 0);
}


