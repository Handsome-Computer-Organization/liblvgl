LV_LIBS_DIR_NAME ?= lv_libs
ifeq ($(LDFLAGS),-D LV_FREETYPE)
include $(LVGL_DIR)/$(LV_LIBS_DIR_NAME)/lv_freetype/lv_freetype.mk
endif
include $(LVGL_DIR)/$(LV_LIBS_DIR_NAME)/lv_bmp/lv_bmp.mk
include $(LVGL_DIR)/$(LV_LIBS_DIR_NAME)/lv_png/lv_png.mk
include $(LVGL_DIR)/$(LV_LIBS_DIR_NAME)/lv_qrcode/lv_qrcode.mk
include $(LVGL_DIR)/$(LV_LIBS_DIR_NAME)/lv_tinygl/lv_tinygl.mk
include $(LVGL_DIR)/$(LV_LIBS_DIR_NAME)/lv_gif/lv_gif.mk



