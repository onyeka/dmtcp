
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
# Build libsyscallsreal.a
#

include $(CLEAR_VARS)

LOCAL_CFLAGS := \
	-DDMTCP_ANDROID -DHAVE_CONFIG_H

LOCAL_C_INCLUDES:= \
	$(LOCAL_PATH) \
	$(dmtcpincludedir)

LOCAL_SRC_FILES := syscallsreal.c trampolines.cpp

LOCAL_MODULE_TAGS := optional
LOCAL_MODULE := libsyscallsreal

include external/stlport/libstlport.mk

include $(BUILD_STATIC_LIBRARY)


#
# Build libnohijack.a
#

include $(CLEAR_VARS)

LOCAL_CFLAGS := \
	-DHAVE_CONFIG_H

LOCAL_C_INCLUDES:= \
	$(LOCAL_PATH) \
	$(dmtcpincludedir)

LOCAL_SRC_FILES := nosyscallsreal.c dmtcpnohijackstubs.cpp

LOCAL_MODULE_TAGS := optional
LOCAL_MODULE := libnohijack

include external/stlport/libstlport.mk

include $(BUILD_STATIC_LIBRARY)


############################################
#
# Build libmtcp.a
#

include $(CLEAR_VARS)

LOCAL_CFLAGS := \
	-DHAVE_CONFIG_H -fno-stack-protector

LOCAL_C_INCLUDES:= \
	$(LOCAL_PATH) \
	$(dmtcpincludedir)


LOCAL_SRC_FILES := \
	mtcp/restore_libc.c
ifeq ($(TARGET_ARCH), arm)
	LOCAL_SRC_FILES += mtcp/syscall-arm.S
endif


LOCAL_MODULE_TAGS := optional
LOCAL_MODULE := libmtcp

#include external/stlport/libstlport.mk

include $(BUILD_STATIC_LIBRARY)


############################################
#
# Build mtcp_restart
#
include $(CLEAR_VARS)

LOCAL_CFLAGS := -g -fno-stack-protector

LOCAL_C_INCLUDES += $(LOCAL_PATH) \
		     $(top_srcdir) \
		     $(dmtcpincludedir) \

LOCAL_SRC_FILES:= mtcp/mtcp_restart.c mtcp/mtcp_check_vdso.ic

LOCAL_MODULE := mtcp_restart

LOCAL_STATIC_LIBRARIES := libmtcp

include $(BUILD_EXECUTABLE)

############################################
#
# Build libdmtcp.so
#

include $(CLEAR_VARS)

LOCAL_LDFLAGS := \
        -Xlinker -znow
LOCAL_CFLAGS := \
	-DHAVE_CONFIG_H -g \


LOCAL_C_INCLUDES:= \
	$(LOCAL_PATH)          \
	external/dmtcp/jalib   \
	external/dmtcp/include

LOCAL_SRC_FILES := \
	dmtcpworker.cpp threadsync.cpp \
	coordinatorapi.cpp execwrappers.cpp \
	mtcpinterface.cpp signalwrappers.cpp \
	threadwrappers.cpp miscwrappers.cpp \
	ckptserializer.cpp writeckpt.cpp \
	glibcsystem.cpp threadlist.cpp \
	siginfo.cpp dmtcpplugin.cpp \
	popen.cpp syslogwrappers.cpp \
	dlsym_default.c

LOCAL_MODULE_TAGS := optional
LOCAL_STATIC_LIBRARIES := libdmtcpinternal libjalib \
			  libsyscallsreal libmtcp
LOCAL_SHARED_LIBRARIES := libdl
LOCAL_MODULE := libdmtcp

include external/stlport/libstlport.mk

include $(BUILD_SHARED_LIBRARY)

#
# Build dmtcp_restart
#

include $(CLEAR_VARS)

LOCAL_CFLAGS := \
	-DHAVE_CONFIG_H

LOCAL_C_INCLUDES:= \
	$(LOCAL_PATH)/../include \

LOCAL_SRC_FILES := dmtcp_restart.cpp util_exec.cpp ckptserializer.cpp

LOCAL_STATIC_LIBRARIES := libdmtcpinternal libjalib libnohijack
LOCAL_SHARED_LIBRARIES := libdl

LOCAL_MODULE_TAGS := optional
LOCAL_MODULE := dmtcp_restart

include external/stlport/libstlport.mk

include $(BUILD_EXECUTABLE)

##############################################
#
# Build dmtcp_coordinator
#

include $(CLEAR_VARS)

LOCAL_CFLAGS := \
        -DHAVE_CONFIG_H 


LOCAL_C_INCLUDES:= \
        $(LOCAL_PATH)          \
        external/dmtcp/jalib   \
        external/dmtcp/include

LOCAL_SRC_FILES := \
        dmtcp_coordinator.cpp \
        lookup_service.cpp \


LOCAL_MODULE_TAGS := optional
LOCAL_STATIC_LIBRARIES := libdmtcpinternal libjalib libnohijack
LOCAL_SHARED_LIBRARIES := libdl
LOCAL_MODULE := dmtcp_coordinator

include external/stlport/libstlport.mk

include $(BUILD_EXECUTABLE)

##############################################

#
# Build dmtcp_launch
#

include $(CLEAR_VARS)

LOCAL_CFLAGS += -Wall -g  -DHAVE_CONFIG_H

LOCAL_C_INCLUDES += $(LOCAL_PATH)/../include 

LOCAL_SRC_FILES:= dmtcp_launch.cpp

LOCAL_MODULE := dmtcp_launch

LOCAL_STATIC_LIBRARIES := libdmtcpinternal libjalib libnohijack 
                          
LOCAL_SHARED_LIBRARIES := libdl

include external/stlport/libstlport.mk

include $(BUILD_EXECUTABLE)

#######################################
include $(call all-makefiles-under,$(LOCAL_PATH)/plugin)
