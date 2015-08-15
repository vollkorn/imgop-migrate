
MAXREMOTE=/home/lukas/uni/master/MasterArbeit/maxelerremote/
MAXINCLUDE_SLIC=/home/lukas/uni/master/MasterArbeit/workspace/optdetect/optdetect/test/slic/include
CFLAGS=-O0 -g -S -emit-llvm -c
CFLAGS_O2=-O2 -g -S -emit-llvm -c
CC=clang
OPT=opt -S

OPT_PHASE1+=-deadargelim -mem2reg -simplifycfg -early-cse -lower-expect -prune-eh -verify

OPT_PHASE2+=-domtree -instcombine -simplifycfg -domtree -early-cse -simplifycfg -domtree -instcombine -simplifycfg
OPT_PHASE2+=-reassociate -domtree -loops -loop-simplify -lcssa -loop-rotate -licm -instcombine
OPT_PHASE2+=-scalar-evolution -loop-simplify -lcssa -indvars -loop-deletion -domtree -memdep -dse -adce -simplifycfg
OPT_PHASE2+=-domtree -instcombine -loops -loop-simplify -lcssa

OPTANALYZE=-analyze -scalar-evolution 

OPERATION=transformation

all: a.out
	 
a.out:
	$(CC) $(CFLAGS) $(OPERATION).c -o $(OPERATION).ll
	
	# Canonicalize phase 1 (reduce costs for inlining)
	$(OPT) -O1 $(OPERATION).ll -o $(OPERATION).ll
	$(OPT) -inline $(OPERATION).ll -o $(OPERATION).ll
	# phase 2: optimize inlined code
	$(OPT) -O1 $(OPERATION).ll -o $(OPERATION).ll
	
	#Strip debug
	$(OPT) -strip-debug $(OPERATION).ll -o $(OPERATION).ll
	# Optimize result
	$(OPT) -O2 $(OPERATION).ll -o $(OPERATION).opt.ll
	
	# Compile hw interface and driver
	$(CC) $(CFLAGS_O2) -I$(MAXINCLUDE_SLIC) hw_interface.c -o hw_interface.ll
	$(CC) $(CFLAGS_O2) $(OPERATION)_driver.c -o $(OPERATION)_driver.ll
	$(CC) $(CFLAGS) interpolation.c -o interpolation.ll
	
	llvm-link $(OPERATION).opt.ll $(OPERATION)_driver.ll interpolation.ll hw_interface.ll ../testdata/access/jpeg.bc -S -o a.ll
	llc a.ll -o a.s
	gcc a.s -o a.out -ldl -ljpeg
	#cp a.s $(MAXREMOTE)
	
clean:
	rm -f *.o *.ll *.s a.out 