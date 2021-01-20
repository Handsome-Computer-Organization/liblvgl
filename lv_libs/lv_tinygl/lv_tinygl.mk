#
# Copyright (C) 2020-2021 HandsomeMod Project
# Release under MIT License
# 
LV_TINYGL_DIR_NAME ?= lv_tinygl

CSRCS += $(wildcard $(LVGL_DIR)/lv_libs/$(LV_TINYGL_DIR_NAME)/*.c)
CSRCS += $(wildcard $(LVGL_DIR)/lv_libs/$(LV_TINYGL_DIR_NAME)/src/*.c)
HEADERS += $(wildcard $(LVGL_DIR)/lv_libs/$(LV_TINYGL_DIR_NAME)/*.h)
HEADERS += $(wildcard $(LVGL_DIR)/lv_libs/$(LV_TINYGL_DIR_NAME)/src/*.h)
