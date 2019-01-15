LOCAL_PATH := $(call my-dir)

common_src_files := boot.c check.c dir.c fat.c main.c
common_includes := external/fsck_msdos
common_cflags := -O2 -g \
    -Wall -Werror \
    -D_BSD_SOURCE \
    -D_LARGEFILE_SOURCE \
    -D_FILE_OFFSET_BITS=64 \
    -Wno-unused-variable \
    -Wno-unused-const-variable \
    -Wno-format \
    -Wno-sign-compare

include $(CLEAR_VARS)
LOCAL_SRC_FILES := $(common_src_files)
LOCAL_C_INCLUDES := $(common_includes)
LOCAL_CFLAGS := $(common_cflags)
LOCAL_MODULE := fsck_msdos
LOCAL_MODULE_TAGS :=
LOCAL_SYSTEM_SHARED_LIBRARIES := libc
include $(BUILD_EXECUTABLE)

include $(CLEAR_VARS)
LOCAL_SRC_FILES := $(common_src_files)
LOCAL_C_INCLUDES := $(common_includes)
LOCAL_CFLAGS := $(common_cflags) -Dmain=fsck_msdos_main
LOCAL_MODULE := libfsck_msdos
LOCAL_MODULE_TAGS :=
include $(BUILD_STATIC_LIBRARY)
