.SUFFIXES: .sys .s
.PHONY: all clean distclean kernel cd

include config.mk

MKISOFS = xorriso -as mkisofs

all: ${LOADER}

clean:
	make -C kernel clean
	rm -f *.sys

distclean: clean
	rm -rf .isodir os.iso

x86_32-pc-cd: x86_16-pc-cd.sys kernel cd
x86_16-pc-cd.sys: x86_16-pc-cd.s x86_16-pc.s
	nasm -f bin -o $@ $<
	cp $@ isodir/system/loader.sys

cd:
	$(MKISOFS) -R -J -c system/bootcat \
	           -b system/loader.sys \
	           -no-emul-boot -boot-load-size 4 \
	           -o os.iso isodir

kernel:
	make -C kernel
	mkdir -p isodir/system/
	cp kernel/kernel.sys isodir/system/

