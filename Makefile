
CFLAGS = -Wall -pedantic

all:	rc2014 rc2014-6502 rc2014-8085 rbcv2 searle linc80 makedisk \
	mbc2 smallz80 sbc2g

rc2014:	rc2014.o ide.o w5100.o
	(cd libz80; make)
	cc -g3 rc2014.o ide.o w5100.o libz80/libz80.o -o rc2014

rbcv2:	rbcv2.o ide.o w5100.o
	(cd libz80; make)
	cc -g3 rbcv2.o ide.o w5100.o libz80/libz80.o -o rbcv2

searle:	searle.o ide.o
	(cd libz80; make)
	cc -g3 searle.o ide.o libz80/libz80.o -o searle

linc80:	linc80.o ide.o
	(cd libz80; make)
	cc -g3 linc80.o ide.o libz80/libz80.o -o linc80

mbc2:	mbc2.o ide.o
	(cd libz80; make)
	cc -g3 mbc2.o libz80/libz80.o -o mbc2

rc2014-6502: rc2014-6502.o 6502.o 6502dis.o
	cc -g3 rc2014-6502.o ide.o w5100.o 6502.o 6502dis.o -o rc2014-6502

rc2014-8085: rc2014-8085.o intel_8085_emulator.o
	cc -g3 rc2014-8085.o ide.o w5100.o intel_8085_emulator.o -o rc2014-8085

smallz80: smallz80.o ide.o
	(cd libz80; make)
	cc -g3 smallz80.o ide.o libz80/libz80.o -o smallz80

sbc2g:	sbc2g.o ide.o
	(cd libz80; make)
	cc -g3 sbc2g.o ide.o libz80/libz80.o -o sbc2g

z80mc:	z80mc.o
	(cd libz80; make)
	cc -g3 z80mc.o libz80/libz80.o -o z80mc

makedisk: makedisk.o ide.o
	cc -O2 -o makedisk makedisk.o ide.o

clean:
	(cd libz80; make clean)
	rm -f *.o *~ rc2014 rbcv2
