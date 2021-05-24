.SUFFIXES: .c .o .s
.PHONY: all clean

SRCS = kernel.c
OBJS = ${SRCS:.c=.o}
LIBS = -lgcc

AS = i686-elf-as
CC = i686-elf-gcc

CFLAGS = -ffreestanding -O2 -Wall -Wextra
LDFLAGS = -T linker.ld -ffreestanding -O2 -nostdlib

all: kernel.sys

clean:
	rm -f kernel.sys ${OBJS}

kernel.sys: ${OBJS}
	${CC} ${LDFLAGS} -o $@ $^ ${LIBS}

.c.o:
	${CC} ${CFLAGS} -c $<
.s.o:
	${AS} -o $@ $<

