#include <stdint.h>

const double TWO_POW_MINUS_53 = 1.0L/9007199254740992.0L;

uint64_t
xoroshiro128plus(uint64_t s[2])
{
    uint64_t s0 = s[0];
    uint64_t s1 = s[1];
    uint64_t result = s0 + s1;
    s1 ^= s0;
    s[0] = ((s0 << 55) | (s0 >> 9)) ^ s1 ^ (s1 << 14);
    s[1] = (s1 << 36) | (s1 >> 28);
    return result;
}

double
xoroshiro128plus_double(uint64_t s[2])
{
    uint64_t rs = xoroshiro128plus(s);
    /* In C, doubles have 53 significant bits (see, e.g.,
     * https://en.wikipedia.org/wiki/IEEE_754). So, we are going to drop 13
     * bits from rs and then divide by 1/2**53 to normalize the output within
     * the (0.0L, 1.0L) interval. */
    return (rs >> 13) * TWO_POW_MINUS_53;
}
