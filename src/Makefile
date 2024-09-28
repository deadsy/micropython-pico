#------------------------------------------------------------------------------
# Makefile to get micropython sources.

TOP = $(shell realpath ..)
DL_DIR = $(TOP)/dl

.PHONY: all
all: \
	.stamp_micropy \

.PHONY: clean
clean:
	-rm -rf $(MICROPY_DIR)
	-rm .stamp*

#-------------------------------------------------------------------------------
# micropython (https://micropython.org/)

MICROPY_VER = 1.23.0
MICROPY_URL = https://micropython.org/resources/source/micropython-$(MICROPY_VER).tar.xz
MICROPY_FILE = micropython-$(MICROPY_VER).tar.xz
MICROPY_TXZ = $(DL_DIR)/$(MICROPY_FILE)
MICROPY_DIR = $(TOP)/src/micropython

$(MICROPY_TXZ):
	mkdir -p $(DL_DIR)
	wget $(MICROPY_URL) -O $(MICROPY_TXZ)

.stamp_micropy: $(MICROPY_TXZ)
	mkdir -p $(MICROPY_DIR)
	tar -C $(MICROPY_DIR) -Jxf $(MICROPY_TXZ) --strip-components 1
	touch $@

#-------------------------------------------------------------------------------
