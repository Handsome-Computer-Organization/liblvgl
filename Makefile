#
# Copyright (C) 2020-2021 HandsomeMod Project
# Release under MIT License
#
 
CC ?= gcc
LVGL_DIR_NAME ?= lvgl
LVGL_DIR ?= ${shell pwd}

WARNINGS ?= -Werror -Wall -Wextra \
						-Wshadow -Wundef -Wmaybe-uninitialized -Wmissing-prototypes -Wno-discarded-qualifiers \
						-Wno-unused-function -Wno-error=strict-prototypes -Wpointer-arith -fno-strict-aliasing -Wno-error=cpp -Wuninitialized \
						-Wno-unused-parameter -Wno-missing-field-initializers -Wno-format-nonliteral -Wno-cast-qual -Wunreachable-code -Wno-switch-default  \
					  -Wreturn-type -Wmultichar -Wformat-security -Wno-ignored-qualifiers -Wno-error=pedantic -Wno-sign-compare -Wno-error=missing-prototypes -Wdouble-promotion -Wclobbered -Wdeprecated  \
						-Wempty-body -Wshift-negative-value -Wstack-usage=2048 \
            -Wtype-limits -Wsizeof-pointer-memaccess -Wpointer-arith
            
CFLAGS += -O3 -g0 -I$(LVGL_DIR)/
LDFLAGS ?= -lm

include $(LVGL_DIR)/lvgl/lvgl.mk
include $(LVGL_DIR)/lv_drivers/lv_drivers.mk
include $(LVGL_DIR)/lv_libs/lv_libs.mk

# Freetype Support
ifeq ($(LDFLAGS),-D LV_FREETYPE)
LDFLAGS += -lfreetype
endif

# Tslib Support
ifeq ($(LDFLAGS),-D LV_TSLIB)
LDFLAGS += -lfreetype
endif

# Libinput Support
ifeq ($(LDFLAGS),-D LV_LIBINPUT)
LDFLAGS += -linput
endif

# sdl2 （pc）
ifeq ($(LDFLAGS),-D LV_TARGET=PC)
LDFLAGS += -lSDL2
endif

# GTK 
ifeq ($(LDFLAGS),-D LV_TARGET=GTK)
LDFLAGS += `pkg-config gtk+-2.0 --cflags --libs` 
endif

# Mouse Support
ifeq ($(LDFLAGS),-D LV_MOUSE)
CSRCS +=$(LVGL_DIR)/lv_extra/mouse_cursor_icon.c
endif


OBJEXT ?= .o

COBJS = $(CSRCS:.c=$(OBJEXT))

SHAREOBJ = liblvgl.so
STATICOBJ = liblvgl.a

SRCS = $(CSRCS) $(MAINSRC)
OBJS = $(COBJS)

INSTALL_HEARERS := $(HEADERS)
HEADERS_INSTALL_DIR := /usr/include/lvgl
LIB_INSTALL_DIR := /usr/lib

## default OBJ -> .so

all: default

%.o: %.c
	@$(CC)  $(CFLAGS) -c $< -o $@ -fPIC
	@echo "CC $<"
    
default: $(AOBJS) $(COBJS) $(MAINOBJ)
	$(CC) -o $(SHAREOBJ) -shared -fPIC $(COBJS) $(LDFLAGS) 
	
static: $(AOBJS) $(COBJS) $(MAINOBJ)
	$(CC) -o $(static) -static -fPIC  $(COBJS) $(LDFLAGS) 

install:
	#install lib
	cp $(SHAREOBJ) /usr/lib
	#install header
	mkdir $(HEADERS_INSTALL_DIR)
	cp $(HEADERS) $(HEADERS_INSTALL_DIR)

clean: 
	rm -f $(SHAREOBJ) $(STATICOBJ) $(COBJS) $(MAINOBJ)

