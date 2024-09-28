#include "fibonacci.h"
#include <stdio.h>
#include <stdlib.h>
#include <stddef.h>

int
main(int argc, const char *argv[])
{

    if (argc != 2) {
        printf("Usage: %s <n>\n", argv[0]);
        return EXIT_FAILURE;
    }

    long n = strtol(argv[1], NULL, 10);
    return fibonacci(n);

}
