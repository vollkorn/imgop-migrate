MAXREMOTE=/home/lukas/uni/master/MasterArbeit/maxelerremote/
MAXINCLUDE_SLIC=../slic/include

CC=clang
OPT=opt
 
all: jpeg.bc
	@echo $< 
	
jpeg.bc: jpeg.c
	@$(CC) -g -O2 -c $< -emit-llvm -o $@
	
	
clean:
	rm -f jpeg.bc