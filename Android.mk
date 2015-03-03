
LOCAL_PATH:= $(call my-dir)

#
# Build libjalib.a
#

include $(CLEAR_VARS)

LOCAL_CFLAGS := \
	-DDMTCP_ANDROID -DHAVE_CONFIG_H -fpermissive

LOCAL_C_INCLUDES:= \
	$(LOCAL_PATH)/include

LOCAL_SRC_FILES := \
	jalib/jalib.cpp jalib/jassert.cpp \
	jalib/jbuffer.cpp jalib/jfilesystem.cpp \
	jalib/jserialize.cpp jalib/jsocket.cpp \
	jalib/jtimer.cpp jalib/jalloc.cpp

LOCAL_MODULE_TAGS := optional
LOCAL_MODULE := libjalib

include external/stlport/libstlport.mk

include $(BUILD_STATIC_LIBRARY)

######################################
include $(call all-makefiles-under,$(LOCAL_PATH))
