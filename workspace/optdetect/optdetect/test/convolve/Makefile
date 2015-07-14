MAXREMOTE=/home/lukas/uni/master/MasterArbeit/maxelerremote/
MAXINCLUDE_SLIC=/home/lukas/uni/master/MasterArbeit/workspace/optdetect/optdetect/test/slic/include
CFLAGS=-O0 -g -S -emit-llvm -c
CC=clang
OPT=opt
OPTFLAGS_0=-mem2reg -instcombine -simplifycfg -inline -early-cse  -loop-simplify -indvars -lcssa -loop-rotate -load ../../../build/lib/liboptmigrate.so -optmigrate -debug-only=optmigrate -S

OPTANALYZE=-analyze -scalar-evolution 
all: a.out
	 
a.out:
	$(CC) $(CFLAGS)  convolve.c -o convolve.ll
	$(OPT) $(OPTFLAGS_0) convolve.ll -o convolve.opt.ll
	$(OPT) -O2 -S convolve.opt.ll -o convolve.opt.ll
	$(CC) $(CFLAGS) -I$(MAXINCLUDE_SLIC) convolve_hw_interface.c -o convolve_hw_interface.ll
	$(CC) $(CFLAGS) convolve_driver.c -o convolve_driver.ll
	
	llvm-link convolve.opt.ll convolve_driver.ll convolve_hw_interface.ll ../testdata/access/jpeg.bc -S -o a.ll
	llc a.ll -o a.s
	gcc a.s -o a.out -ldl -ljpeg
	cp a.s $(MAXREMOTE)
	
clean:
	rm -f a.out	convolve.ll a.ll a.s convolve_hw_interface.ll