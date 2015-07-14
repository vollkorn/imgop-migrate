


MAXREMOTE=/home/lukas/uni/master/MasterArbeit/maxelerremote/
MAXINCLUDE_SLIC=/home/lukas/uni/master/MasterArbeit/workspace/optdetect/optdetect/test/slic/include
CFLAGS=-O0 -g -S -emit-llvm -c
CFLAGS_O2=-O2 -g -S -emit-llvm -c
CC=clang
OPT=opt
OPTFLAGS=-mem2reg -instcombine -simplifycfg -inline -early-cse  -loop-simplify -indvars -lcssa -loop-rotate -S

OPTANALYZE=-analyze -scalar-evolution 

OPERATION=transformation

all: a.out
	 
a.out:
	$(CC) $(CFLAGS) $(OPERATION).c -o $(OPERATION).ll
	$(OPT) -mem2reg -S $(OPERATION).ll -o $(OPERATION).ll
	$(OPT) $(OPTFLAGS) $(OPERATION).ll -o $(OPERATION).opt.ll
	$(OPT) -O2 -S $(OPERATION).opt.ll -o $(OPERATION).opt.ll
	$(CC) $(CFLAGS) -I$(MAXINCLUDE_SLIC) hw_interface.c -o hw_interface.ll
	$(CC) $(CFLAGS_O2) $(OPERATION)_driver.c -o $(OPERATION)_driver.ll
	
	llvm-link $(OPERATION).opt.ll $(OPERATION)_driver.ll hw_interface.ll ../testdata/access/jpeg.bc -S -o a.ll
	llc a.ll -o a.s
	gcc a.s -o a.out -ldl -ljpeg
	#cp a.s $(MAXREMOTE)
	
clean:
	rm -f a.out	$(OPERATION).ll a.ll a.s hw_interface.ll