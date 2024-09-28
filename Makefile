TARGET = fibonacci

SRCDIR = src
OBJDIR = obj
BINDIR = bin
TESTDIR = tests

SRCS = $(wildcard $(SRCDIR)/*.c)
OBJS = $(patsubst $(SRCDIR)/%.c, $(OBJDIR)/%.o, $(SRCS))
TESTS = $(patsubst $(TESTDIR)/%.c, $(BINDIR)/tests/%, $(wildcard $(TESTDIR)/*.c))

MAIN_OBJ = $(OBJDIR)/main.o

CC = clang
CFLAGS = -xc -Wall -Wextra -Werror -g -std=c23 -Iinclude

LD = clang
LFLAGS = -g -fuse-ld=lld

compile_flags.txt:
	@echo $(CFLAGS) | tr ' ' '\n' > $@

$(OBJDIR)/%.o: $(SRCDIR)/%.c
	@mkdir -p $(@D)
	$(CC) $(CFLAGS) -c $< -o $@

$(BINDIR)/$(TARGET): $(OBJS)
	@mkdir -p $(@D)
	$(LD) $(LFLAGS) $^ -o $@

$(OBJDIR)/tests/%.o: $(TESTDIR)/%.c
	@mkdir -p $(@D)
	$(CC) $(CFLAGS) -c $< -o $@

$(BINDIR)/tests/%: $(filter-out $(MAIN_OBJ), $(OBJS)) $(OBJDIR)/tests/%.o
	@mkdir -p $(@D)
	$(LD) $(LFLAGS) $^ -o $@
	$@

tests: $(TESTS)

clean:
	$(RM) -r $(OBJDIR) $(BINDIR)

all: $(TESTS) $(BINDIR)/$(TARGET)

.PHONY: clean all compile_flags.txt
