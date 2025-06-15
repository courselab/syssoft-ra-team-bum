bin = eg-00.bin eg-01.bin eg-02.bin eg-03-bug.bin eg-03-bug-2.bin eg-03.bin eg-04.bin eg-05.bin eg-06.bin eg-07.bin eg-08.bin eg-09.bin eg-10.bin eg-11.bin eg-12.bin eg-13.bin

eg-00.bin : eg-00.hex
	$(TOOL_DIR)/hex2bin $< $@

#
# eg-01
#

eg-01.bin : eg-01.o
	ld -melf_i386 --oformat=binary  $< -o $@

eg-01.o : eg-01.S
	as --32 $< -o $@

#
# eg-02
#

eg-02.bin : eg-02.o
	ld -melf_i386 --oformat=binary  $< -o $@

eg-02.o : eg-02.S
	as --32 $< -o $@


#
# eg-03
#

eg-03-bug.bin : eg-03.o
	-ld -melf_i386 --oformat=binary  $< -o $@

eg-03-bug-2.bin : eg-03.o
	ld -melf_i386 --oformat=binary  -Ttext=0x0000 $< -o $@

eg-03.bin : eg-03.o
	ld -melf_i386 --oformat=binary -Ttext=0x7c00 $< -o $@

eg-03.o : eg-03.S
	as --32 $< -o $@

#
# eg-04
#

eg-04.o eg-05.o eg-06.o eg-07.o: %.o : %.S
	as --32 $< -o $@

eg-04.bin eg-05.bin eg-06.bin eg-07.bin : %.bin : %.o
	ld -melf_i386 --oformat=binary -Ttext=0x7c00 $< -o $@


#
# eg-08
#

eg-08.bin  : eg-08-crt0.o eg-08.o eg-08.ld
	ld -melf_i386 -T eg-08.ld eg-08-crt0.o eg-08.o -o $@

eg-08.o eg-08-crt0.o : %.o : %.S
	as --32 $< -o $@

#
# eg-09
#

eg-09.bin: eg-09.o eg-09-crt0.o eg-09.ld
	ld -melf_i386 -T eg-09.ld eg-09.o -o $@

eg-09.o eg-09-crt0.o: %.o : %.S
	as --32 $< -o $@


#
# eg-10
#

eg-10.bin: eg-10.o eg-10-crt0.o eg-10.ld
	ld -melf_i386 -T eg-10.ld $< -o $@

eg-10-crt0.o: %.o : %.S
	as --32 $< -o $@

eg-10.o: eg-10.s
	as --32 $< -o $@

eg-10.s : eg-10.c
	gcc -S -m16 -O0 --freestanding -nostdlib -fno-pic $(NO_CF_PROTECT) -fno-asynchronous-unwind-tables $< -o $@



#
# eg-11
#

eg-11.bin: eg-11.o eg-11-crt0.o eg-11.ld
	ld -melf_i386 -T eg-11.ld eg-11.o -o $@

eg-11-crt0.o : %.o : %.S
	as --32 $< -o $@

eg-11.o : %.o : %.s
	as --32 $< -o $@

eg-11.s  : %.s : %.c
	gcc -S -m16 -O0 --freestanding -nostdlib -fno-pic $(NO_CF_PROTECT) -fno-asynchronous-unwind-tables $< -o $@


#
# eg-12
#

eg-12.bin: eg-12.o eg-12-crt0.o eg-12-lib.o eg-12.ld
	ld -melf_i386 -T eg-12.ld eg-12.o eg-12-lib.o -o $@

eg-12-crt0.o : %.o : %.S
	as --32 $< -o $@

eg-12.o eg-12-lib.o : %.o : %.s
	as --32 $< -o $@

eg-12.s eg-12-lib.s : %.s : %.c
	gcc -S -m16 -O0 --freestanding -nostdlib -fno-pic $(NO_CF_PROTECT) -fno-asynchronous-unwind-tables $< -o $@



#
# eg-13
#

eg-13.bin: eg-13-crt0.o eg-13.o eg-13-lib.o eg-13.ld # libeg-13.a
	ld -melf_i386 -T eg-13.ld -L. eg-13.o -o $@  #-lc

eg-13-crt0.o : %.o : %.S
	as --32 $< -o $@

eg-13.o eg-13-lib.o : %.o : %.s
	as --32 $< -o $@

eg-13.s eg-13-lib.s : %.s : %.c
	gcc -S -m16 -O0 --freestanding -nostdlib -fno-pic $(NO_CF_PROTECT) -fno-asynchronous-unwind-tables -I. $< -o $@


# libeg-13.a : eg-13-lib.o
# 	ar rcs libeg-13.a $^




##
## Housekeeping
##

.PHONY: clean

clean :
	rm -f *.o *.bin *.s *.a


