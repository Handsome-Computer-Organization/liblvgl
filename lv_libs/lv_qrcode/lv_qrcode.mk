#
# Copyright (C) 2020-2021 HandsomeMod Project
# Release under MIT License
# 
LV_QRCODE_DIR_NAME ?= lv_qrcode

CSRCS += $(wildcard $(LVGL_DIR)/lv_libs/$(LV_QRCODE_DIR_NAME)/*.c)
HEADERS += $(wildcard $(LVGL_DIR)/lv_libs/$(LV_QRCODE_DIR_NAME)/*.h)
