MODULENAME := hideproc
obj-m += $(MODULENAME).o
$(MODULENAME)-y += main.o

KERNELDIR ?= /lib/modules/`uname -r`/build
PWD       := $(shell pwd)

all:
	$(MAKE) -C $(KERNELDIR) M=$(PWD) modules
insert:
	sudo insmod $(MODULENAME).ko 
remove:
	sudo rmmod $(MODULENAME)
clean:
	$(MAKE) -C $(KERNELDIR) M=$(PWD) clean
