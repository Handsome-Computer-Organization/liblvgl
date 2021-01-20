#
# Copyright (C) 2020-2021 HandsomeMod Project
# Release under MIT License
# 
LV_FREETYPE_DIR_NAME ?= lv_png

#if we dont need freetype just not combine it
$(ifeq($(LDFLAGS),-D LV_FREETYPE,
CSRCS += $(wildcard $(LVGL_DIR)/lv_libs/$(LV_FREETYPE_DIR_NAME)/*.c)
HEADERS += $(wildcard $(LVGL_DIR)/lv_libs/$(LV_FREETYPE_DIR_NAME)/*.h))
