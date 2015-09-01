
PRJ_NAME=optdetect

WORKING_DIR=/home/lukas/uni/master/MasterArbeit
WORKSPACE=$(WORKING_DIR)/workspace
MAXREMOTE=$(WORKING_DIR)/maxelerremote

PRJ_DIR=$(WORKSPACE)/$(PRJ_NAME)

MAXINCLUDE_SLIC=$(PRJ_DIR)/$(PRJ_NAME)/slic/include

OPT_EXT_LIB=$(PRJ_DIR)/build/lib/liboptmigrate.so

PATTERN_SRC=$(PRJ_DIR)/$(PRJ_NAME)/pattern/pattern.db

HWIFACE_DIR=$(PRJ_DIR)/$(PRJ_NAME)/hwiface

TESTACCESS_DIR=$(PRJ_DIR)/$(PRJ_NAME)/test/testdata/access

CC=clang
OPT=opt

