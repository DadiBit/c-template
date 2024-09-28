# C project Template

## Quick Start

1. Replace the `TEMPLATE` prefix within the headers files in the `include`/`src` directory with your project name.
2. Run `make all` to test and build and the project.
3. Add, remove, or modify the `src` and `include` directories as needed.
4. Modify the `Makefile` to suit your needs (ie the `TARGET` variable).
5. Run `make clean all` to rebuild the project.

## Project Structure

- `include`: contains the project headers.
- `src`: contains the project source files.
- `tests`: contains the project tests.
- `obj`: contains the project object files.
- `bin`: contains the project and tests binary.
- `compile_flags.txt`: contains the project compilation flags for clangd.
- `Makefile`: contains the project build rules.

## Makefile rules

### Tests

```bash
make tests
```

This builds each test in the `tests` directory and runs them.
Each test binary includes all `src` objects (except the `main.o` one).

You may only test non-static functions of source files.

### Binary Target

```bash
make bin/fibonacci
```

This builds the `fibonacci` binary.
You may change the `TARGET` variable in the `Makefile` to build with a different name.
Update the `MAIN_OBJ` to point to the object containing the `main` function.

### Clean

```bash
make clean
```

This removes the `obj` and `bin` directories.
