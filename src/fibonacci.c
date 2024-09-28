#include "sequence.h"

static inline int
sum(int a, int b)
{
    return a + b;
}

int
fibonacci(int n)
{
    if (n < 2)
        return sequence[n];
    return sum(fibonacci(n - 1), fibonacci(n - 2));
}
