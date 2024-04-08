# Get options
num := false

ROOT_PATH := $(abspath $(CURDIR)/../..)
INC_PATH := $(ROOT_PATH)/src/include
VSRC_PATH := $(ROOT_PATH)/src/booth
TB_PATH := $(ROOT_PATH)/test/testbench
WORKDIR := $(shell pwd)
WAVEDIR := $(WORKDIR)/wave

INCS += $(wildcard $(INC_PATH)/*.v)
VSRCS += $(wildcard $(VSRC_PATH)/*.v)
TB_NAME := booth_test
TESTBENCH := $(TB_PATH)/$(TB_NAME).v
CWRAPFILE := $(WORKDIR)/$(TB_NAME).cpp

VFLAGS += --timing -Wno-fatal --trace -cc -exe -build
VFLAGS += -I$(INC_PATH)
ifdef num
VFLAGS += -DTEST_NUM=$(num)
endif

.PHONY: all run all-wave wave

all: $(INCS) $(TESTBENCH) $(VSRCS) $(CWRAPFILE)
	verilator $(VFLAGS) $(TESTBENCH) $(VSRCS) $(CWRAPFILE)

run: all
	@echo "\n\033[1;34mVERILATOR: Simulation Begin!\n"
	@$(WORKDIR)/obj_dir/V$(TB_NAME)

all-wave: $(INCS) $(TESTBENCH) $(VSRCS) $(CWRAPFILE)
	$(eval VFLAGS += -D__VCD_OUT)
	$(warning new define __VCD_OUT)
	verilator $(VFLAGS) $(TESTBENCH) $(VSRCS) $(CWRAPFILE)

wave: all-wave
	@echo "\n\033[1;34mVERILATOR: Simulation Begin!\n"
	@$(WORKDIR)/obj_dir/V$(TB_NAME)
	@mv -i -v *.vcd $(WAVEDIR)
