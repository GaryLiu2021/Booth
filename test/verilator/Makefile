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

.PHONY: all run all-wave wave testnum

testnum: 
ifdef num
	$(eval VFLAGS += -DTESTNUM=$(num))
	@echo "\033[1;34mMAKE: Test num set to $(num).\033[0m"
endif

all: $(INCS) $(TESTBENCH) $(VSRCS) $(CWRAPFILE) testnum
	verilator $(VFLAGS) $(TESTBENCH) $(VSRCS) $(CWRAPFILE)

run: all
	@echo "\n\033[1;34mVERILATOR: Simulation Begin!\n"
	@$(WORKDIR)/obj_dir/V$(TB_NAME)

all-wave: $(INCS) $(TESTBENCH) $(VSRCS) $(CWRAPFILE) testnum
	$(eval VFLAGS += -D__VCD_OUT)
	$(warning new define __VCD_OUT)
	verilator $(VFLAGS) $(TESTBENCH) $(VSRCS) $(CWRAPFILE)

wave: all-wave
	@echo "\n\033[1;34mVERILATOR: Simulation Begin!\n"
	@$(WORKDIR)/obj_dir/V$(TB_NAME)
	@mv -i -v *.vcd $(WAVEDIR)
