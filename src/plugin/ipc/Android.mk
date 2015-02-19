
LOCAL_PATH:= $(call my-dir)

#
# Build alloc plugin
#

include $(CLEAR_VARS)

LOCAL_CFLAGS := \
	-DHAVE_CONFIG_H -g \

LOCAL_ALLOW_UNDEFINED_SYMBOLS=true

LOCAL_C_INCLUDES:= \
	$(LOCAL_PATH)           \
	bionic/libc/kernel/uapi \
	external/dmtcp/jalib    \
	external/dmtcp/include

LOCAL_SRC_FILES := \
       ipc.cpp util_ipc.cpp connection.cpp connectionidentifier.cpp connectionlist.cpp \
       socket/connectionrewirer.cpp socket/kernelbufferdrainer.cpp \
       socket/socketwrappers.cpp socket/socketconnection.cpp socket/socketconnlist.cpp \
       event/util_descriptor.cpp event/eventwrappers.cpp event/eventconnection.cpp event/eventconnlist.cpp\
       file/filewrappers.cpp file/fileconnection.cpp file/fileconnlist.cpp  \
       ssh/ssh.cpp ssh/util_ssh.cpp ssh/sshdrainer.cpp  \
       timer/timerlist.cpp timer/timerwrappers.cpp


LOCAL_MODULE_TAGS := optional
LOCAL_MODULE := libdmtcp_ipc

include external/stlport/libstlport.mk

include $(BUILD_SHARED_LIBRARY)
