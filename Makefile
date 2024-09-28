#------------------------------------------------------------------------------
# Makefile for Micropython running on pico/pico2 devices

TOP = $(shell realpath .)

EXT = $(TOP)/ext
SRC = $(TOP)/src

SDK_PATH = $(EXT)/sdk
TOOLS_PATH = $(EXT)/usr/bin
PICOTOOL = $(EXT)/usr/lib/cmake/picotool
PIOASM = $(EXT)/usr/lib/cmake/pioasm

#------------------------------------------------------------------------------

# pick a board
BOARD = pico
#BOARD = pico2
#BOARD = pimoroni_pico_plus2_rp2350

# pick a compiler
#COMPILER = pico_riscv_gcc
COMPILER = pico_arm_cortex_m0plus_gcc
#COMPILER = pico_arm_cortex_m33_gcc

# pick a platform
PLATFORM = rp2040
#PLATFORM = rp2350-riscv
#PLATFORM = rp2350-arm-s

BLD_PATH = $(TOP)/build
SRC_PATH = $(TOP)/src/micropython

.PHONY: all
all: .stamp_ext .stamp_src

#------------------------------------------------------------------------------

.PHONY: clean
clean:
	-rm -rf $(BLD_PATH)

.PHONY: clobber
clobber: clean
	make -C $(EXT) clean
	make -C $(SRC) clean
	-rm .stamp*

.stamp_ext:
	make -C $(EXT) all
	touch $@

.stamp_src:
	make -C $(SRC) all
	touch $@

#------------------------------------------------------------------------------
