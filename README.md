# Liblvgl
# 这是 HandsomeMod Graphics Layer 的一部分（hmgl = liblvgl + libhmgl + libattila + apps） 
 基于Gabor Kiss-Vamosi先生的Lvgl 7.0分支修改而来 尽量保有原来lvgl的特性和api 以HandsomeMod系统组件的一部分存在
 该项目暂时命名为liblvgl 仍使用lvgl的MIT协议 与系统交互的libhmgl为HandsomeMod Project的专有技术和软件
 旨在打造Linux下可作为动态链接库的轻量级图形库实现，不再兼容原项目中兼容广大的MCU平台而专注于Linux平台
## Author： handsomeyingyan <handsomeyingyan@gmail.com> && WMWYT<WMWYT@github.com>


# 可以使用的条件编译CFLAGS
- -D LV_FREETYPE freetype支持
- -D LV_MOUSE 设备包含鼠标
- -D LV_TSLIB 设备使用tslib响应触屏
- -D LV_LIBINPUT 设备使用libinput相应输入
- -D LV_TARGET=PC SDL的模拟实现
- -D LV_TARGET=FB  直接在linux的framebuffer上绘图
- -D LV_TARGET=DRM 使用Linux的drm框架
- -D LV_TARGET=GTK 构建为gtk应用程序

# 待实现的目标
- lvgl与ffmpeg的multimedia控件实现
- v4l2摄像头控件实现
- PKGBUILD 和 debian 打包
