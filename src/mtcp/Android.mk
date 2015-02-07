
LOCAL_PATH:= $(call my-dir)

top_srcdir := external/dmtcp
dmtcpincludedir=$(top_srcdir)/include

#
# Build libmtcp.a
#

include $(CLEAR_VARS)

LOCAL_CFLAGS := \
	-DHAVE_CONFIG_H -fno-stack-protector

LOCAL_C_INCLUDES:= \
	$(LOCAL_PATH) \
	$(dmtcpincludedir)
	#bionic/libc/kernel/uapi


LOCAL_SRC_FILES := \
	restore_libc.c
ifeq ($(TARGET_ARCH), arm)
	LOCAL_SRC_FILES += syscall-arm.S
endif


LOCAL_MODULE_TAGS := optional
LOCAL_MODULE := libmtcp

#include external/stlport/libstlport.mk

include $(BUILD_STATIC_LIBRARY)
