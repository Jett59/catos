ARCH            = $(shell uname -m | sed s,i[3456789]86,ia32,)

EFIINC          = /usr/include/efi
EFIINCS         = -I$(EFIINC) -I$(EFIINC)/$(ARCH) -I$(EFIINC)/protocol

CFLAGS          = $(EFIINCS) -fno-stack-protector -fpic \
		  -fshort-wchar -mno-red-zone -Wall 
ifeq ($(ARCH),x86_64)
  CFLAGS += -DEFI_FUNCTION_WRAPPER
endif

all: objects.o

objects.o: $(patsubst %.c,%.o,$(shell ls | grep .c))
	ld -relocatable $^ -o $@