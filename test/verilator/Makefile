# Set paths
ROOT_PATH := $(abspath $(CURDIR)/../..)
INC_PATH := $(ROOT_PATH)/src/include
VSRC_PATH := $(ROOT_PATH)/src/booth
TB_PATH := $(ROOT_PATH)/test/testbench
WORKDIR := $(shell pwd)
BUILDDIR:= $(WORKDIR)/build
WAVEDIR := $(WORKDIR)/wave
$(shell mkdir -p $(BUILDDIR))
$(shell mkdir -p $(WAVEDIR))

# Set files
INCS += $(wildcard $(INC_PATH)/*.v)
VSRCS += $(wildcard $(VSRC_PATH)/*.v)
TB_NAME := booth_test
TESTBENCH := $(TB_PATH)/$(TB_NAME).v
CWRAPFILE := $(WORKDIR)/$(TB_NAME).cpp
OUTNAME := V$(TB_NAME)
EXEFILE := $(BUILDDIR)/$(OUTNAME)

# Set flags
VFLAGS += --timing -Wno-fatal --trace -cc -exe -build
VFLAGS += -I$(INC_PATH)
VFLAGS += --Mdir $(BUILDDIR)
VFLAGS += -o $(OUTNAME)

# Get option [-num]
ifeq ($(num),)
num := 10
endif

# Config test num
CFG_FILE_TESTNUM := $(BUILDDIR)/config.testnum
ifeq ($(wildcard $(CFG_FILE_TESTNUM)),)
$(shell touch $(CFG_FILE_TESTNUM))
endif
CFG_TESTNUM := $(shell cat $(CFG_FILE_TESTNUM))

ifneq ($(CFG_TESTNUM),$(num))
VFLAGS += -DTESTNUM=$(num)
$(shell echo $(num) > $(CFG_FILE_TESTNUM))
endif

# Config wave trace
CFG_FILE_WAVE := $(BUILDDIR)/config.wave
ifeq ($(wildcard $(CFG_FILE_WAVE)),)
$(shell touch $(CFG_FILE_WAVE))
endif
CFG_WAVE := $(shell cat $(CFG_FILE_WAVE))

.PHONY: all run wave clean config-% sim

all: $(EXEFILE)

clean:
	rm -rf $(BUILDDIR)

$(EXEFILE): $(INCS) $(TESTBENCH) $(VSRCS) $(CWRAPFILE) $(CFG_FILE_TESTNUM) $(CFG_FILE_WAVE)
	@echo "\033[1;34mCompiling with TESTNUM = $(num)...\033[0m"
	verilator $(VFLAGS) $(TESTBENCH) $(VSRCS) $(CWRAPFILE)

ifneq ($(CFG_WAVE),off)
config-run:
	@echo off > $(CFG_FILE_WAVE)
else
config-run:
endif

ifneq ($(CFG_WAVE),on)
config-wave:
	@echo on > $(CFG_FILE_WAVE)
else
config-wave:
endif
	$(eval VFLAGS += -D__VCD_OUT)
	@echo "\033[1;33mVERILATOR: WAVE TRACE ON!\033[0m"

sim:
	@echo "\n\033[1;34mVERILATOR: Simulation Begin!\033[0m"
	@$(EXEFILE)

run: config-run $(EXEFILE) sim

wave: config-wave $(EXEFILE) sim
	@mv -i -v *.vcd $(WAVEDIR)
