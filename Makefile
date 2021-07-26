MODULENAME := hideproc
obj-m += $(MODULENAME).o
$(MODULENAME)-y += main.o

GIT_HOOKS := .git/hooks/applied

KERNELDIR ?= /lib/modules/`uname -r`/build
PWD       := $(shell pwd)


$(GIT_HOOKS):
	@scripts/install-git-hooks
	@echo

all: $(GIT_HOOKS)
	$(MAKE) -C $(KERNELDIR) M=$(PWD) modules
insert:
	sudo insmod $(MODULENAME).ko 
remove:
	sudo rmmod $(MODULENAME)
clean:
	$(MAKE) -C $(KERNELDIR) M=$(PWD) clean
