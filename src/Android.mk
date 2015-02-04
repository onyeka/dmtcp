
LOCAL_PATH:= $(call my-dir)

top_srcdir := $(LOCAL_PATH)/..
jalibdir=$(top_srcdir)/jalib
dmtcpincludedir=$(top_srcdir)/include

#
# Build libdmtcpinternal.a
#

include $(CLEAR_VARS)

LOCAL_CFLAGS := \
	-DDMTCP_ANDROID -DHAVE_CONFIG_H -fpermissive

LOCAL_C_INCLUDES:= \
	$(LOCAL_PATH) \
	$(LOCAL_PATH)/mtcp \
	$(jalibdir) \
	$(dmtcpincludedir) \
	bionic/libc/kernel/uapi


LOCAL_SRC_FILES := \
	dmtcpmessagetypes.cpp  coordinatorapi.cpp \
	uniquepid.cpp shareddata.cpp \
	util_exec.cpp util_gen.cpp util_init.cpp \
	jalibinterface.cpp processinfo.cpp


LOCAL_MODULE_TAGS := optional
LOCAL_MODULE := libdmtcpinternal

include external/stlport/libstlport.mk

include $(BUILD_STATIC_LIBRARY)

#
# Build libdmtcp.so
#

#include $(CLEAR_VARS)

#LOCAL_LDFLAGS := \
#        -Xlinker -znow
#LOCAL_CFLAGS := \
#	-DHAVE_CONFIG_H -g \
#
#LOCAL_ALLOW_UNDEFINED_SYMBOLS=true

#LOCAL_C_INCLUDES:= \
#	$(LOCAL_PATH)                \
#	external/dmtcp/jalib   \
#	external/dmtcp/include

#LOCAL_SRC_FILES := \
#	dmtcpworker.cpp \
#	threadsync.cpp \
#	coordinatorapi.cpp \
#	execwrappers.cpp \
#	mtcpinterface.cpp \
#	signalwrappers.cpp \
#	threadwrappers.cpp \
#	miscwrappers.cpp \
#	ckptserializer.cpp \
#	writeckpt.cpp \
#	glibcsystem.cpp \
#	threadlist.cpp \
#	siginfo.cpp \
#	dmtcpplugin.cpp \
#	popen.cpp \
#	syslogwrappers.cpp \
#	dlsym_default.c

#LOCAL_MODULE_TAGS := optional
#LOCAL_MODULE := libdmtcp_alloc

#include $(BUILD_SHARED_LIBRARY)
