include Kbuild

KERNELRELEASE ?= `uname -r`
KERNEL_DIR ?= /lib/modules/$(KERNELRELEASE)/build
PWD := $(shell pwd)

EXTRA_CFLAGS += -Wall
EXTRA_CFLAGS += -I$(KERNEL_DIR)/net/ipv4

all:
	@echo "Building tcp..."
	$(MAKE) -C $(KERNEL_DIR) M=$(PWD) modules

clean:
	$(MAKE) -C $(KERNEL_DIR) M=$(PWD) clean
