obj-m := tcp_bbr.o

# Ruta del kernel fuente (clonado en GitHub Actions)
KERNEL_DIR ?= $(PWD)/kernel

# Variables para compilar kernel Android ARM64
ARCH := arm64
CROSS_COMPILE := aarch64-linux-gnu-
PWD := $(shell pwd)

EXTRA_CFLAGS += -Wall

all:
	@echo "Building tcp_bbr.ko..."
	$(MAKE) -C $(KERNEL_DIR) M=$(PWD) ARCH=$(ARCH) CROSS_COMPILE=$(CROSS_COMPILE) modules

clean:
	$(MAKE) -C $(KERNEL_DIR) M=$(PWD) clean
