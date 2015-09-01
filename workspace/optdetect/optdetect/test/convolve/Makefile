
include ../Common.mk

CFLAGS=-O0 -g -S -emit-llvm -c
#OPTFLAGS_0=-mem2reg -instcombine -simplifycfg -inline -early-cse -loop-simplify -indvars -lcssa -loop-rotate -S
OPTFLAGS=-O1
Operation=convolve

all: a.out
	 
a.out:
	$(CC) $(CFLAGS)  $(Operation).c -o $(Operation).ll
	$(OPT) $(OPTFLAGS_0) $(Operation).ll -o $(Operation).opt.ll
	
	$(OPT) $(OPTFLAGS) -S $(Operation).opt.ll -o $(Operation).opt.ll
	$(OPT) -load $(OPT_EXT_LIB) -optmigrate $(Operation).opt.ll -patterndb $(PATTERN_SRC) -S -o $(Operation).mig.ll
	
	$(CC) $(CFLAGS) $(Operation)_driver.c -o $(Operation)_driver.ll
	
	llvm-link $(Operation).mig.ll \
			  $(Operation)_driver.ll \
			  $(HWIFACE_DIR)/max_hw_iface.bc \
			  $(TESTACCESS_DIR)/jpeg.bc -S -o a.ll
			  
	llc a.ll -o a.s
	#gcc a.s -o a.out -ldl -ljpeg
	cp a.s $(MAXREMOTE)/impl_$(Operation)
	
clean:
	rm -f a.out *.ll *.s