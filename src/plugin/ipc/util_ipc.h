#ifndef UTIL_SSH_H
#define UTIL_SSH_H

#include <sys/socket.h>
#include <sys/un.h>
#ifdef __ANDROID__
/* Including string.h for undefined function memset in Android*/
#include<string.h>
#endif
#include "ipc.h"
#include "dmtcp.h"

extern "C" LIB_PRIVATE
int sendFd(int restoreFd, int32_t fd, void *data, size_t len,
           struct sockaddr_un& addr, socklen_t addrLen) __attribute((weak));
extern "C" LIB_PRIVATE
int32_t receiveFd(int restoreFd, void *data, size_t len) __attribute((weak));

#endif
