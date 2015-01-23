
LOCAL_PATH:= $(call my-dir)

#
# Build dl plugin
#

include $(CLEAR_VARS)

LOCAL_CFLAGS := \
	-DHAVE_CONFIG_H -g \

LOCAL_ALLOW_UNDEFINED_SYMBOLS=true

LOCAL_C_INCLUDES:= \
	$(LOCAL_PATH)                \
	external/dmtcp/jalib   \
	external/dmtcp/include

LOCAL_SRC_FILES := \
	dlwrappers.cpp

LOCAL_MODULE_TAGS := optional
LOCAL_MODULE := libdmtcp_dl

include $(BUILD_SHARED_LIBRARY)
