CFLAGS=-O0 -S -emit-llvm -c
CC=clang
OPT=opt
OPTFLAGS=-mem2reg -loop-simplify -indvars -dce -constprop -S
OPTANALYZE=-analyze -scalar-evolution 
all: a.out
	
	
a.out:
	$(CC) $(CFLAGS) accumulate.c -o accumulate.ll
	$(OPT) $(OPTFLAGS) accumulate.ll -o accumulate.opt.ll
	$(OPT) $(OPTANALYZE) accumulate.opt.ll > accumulate.opt.se
	$(CC) $(CFLAGS) accumulate_driver.c -o accumulate_driver.ll
	
	llvm-link accumulate.opt.ll accumulate_driver.ll -o a.out
	
clean:
	rm -f a.out	