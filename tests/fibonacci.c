#include "fibonacci.h"
#include <assert.h>

int
main(void)
{
    assert(fibonacci(0) == 0);
    assert(fibonacci(1) == 1);
    assert(fibonacci(2) == 1);
    assert(fibonacci(3) == 2);
    assert(fibonacci(4) == 3);
    assert(fibonacci(5) == 5);
    assert(fibonacci(6) == 8);
    assert(fibonacci(7) == 13);
    assert(fibonacci(8) == 21);
    assert(fibonacci(9) == 34);
    return 0;
}