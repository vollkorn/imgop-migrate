MAXREMOTE=/home/lukas/uni/master/MasterArbeit/maxelerremote/
MAXINCLUDE_SLIC=../slic/include

CC=clang
OPT=opt
 
all: max_hw_iface
	@echo Building hardware interface
	
max_hw_iface:
	@$(CC) $(CFLAGS) -O2 -g -I$(MAXINCLUDE_SLIC) -c $@.c -emit-llvm -o $@.bc
	
	
clean:
	rm -f max_hw_iface.bc 