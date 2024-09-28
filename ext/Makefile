#------------------------------------------------------------------------------
# Makefile to get and build external dependencies.

TOP = $(shell realpath ..)
DL_DIR = $(TOP)/dl
USR_DIR = $(TOP)/ext/usr

.PHONY: all
all: .stamp_gnu_arm

.PHONY: clean
clean:
	-rm -rf $(USR_DIR)
	-rm .stamp*

#------------------------------------------------------------------------------
# gnu arm tools

GNU_ARM_VER = 13.3.rel1
GNU_ARM_URL = https://developer.arm.com/-/media/Files/downloads/gnu/$(GNU_ARM_VER)/binrel/arm-gnu-toolchain-$(GNU_ARM_VER)-x86_64-arm-none-eabi.tar.xz
GNU_ARM_FILE = arm-gnu-toolchain-$(GNU_ARM_VER)-x86_64-arm-none-eabi.tar.xz
GNU_ARM_TXZ = $(DL_DIR)/$(GNU_ARM_FILE)

$(GNU_ARM_TXZ):
	mkdir -p $(DL_DIR)
	wget $(GNU_ARM_URL) -O $(GNU_ARM_TXZ)

.stamp_gnu_arm: $(GNU_ARM_TXZ)
	mkdir -p $(USR_DIR)
	tar -C $(USR_DIR) -Jxf $(GNU_ARM_TXZ) --strip-components 1
	touch $@

#------------------------------------------------------------------------------
