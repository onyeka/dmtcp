/* include/config.h.  Generated from config.h.in by configure.  */
/* include/config.h.in.  Generated from configure.ac by autoheader.  */

/* Checkpoint signal to be used */
/* #undef CKPT_SIGNAL */

/* Compiling in 32 bit mode on 64 bit linux. */
/* #undef CONFIG_M32 */

/* Verbose debug output and log files in $DMTCP_TMPDIR */
/* #undef DEBUG */

/* Always enable this. */
#define DMTCP 1

/* Generated by readelf -aW | grep interpreter */
#define ELF_INTERPRETER "/lib64/ld-linux-x86-64.so.2"

/* Child process does checkpointing */
/* #undef FORKED_CHECKPOINTING */

/* Define to 1 if you have the <infiniband/verbs.h> header file. */
/* #undef HAVE_INFINIBAND_VERBS_H */

/* Define to 1 if you have the <inttypes.h> header file. */
/* #undef HAVE_INTTYPES_H */

/* Define to 1 if you have the <linux/version.h> header file. */
#define HAVE_LINUX_VERSION_H 1

/* Define to 1 if you have the <memory.h> header file. */
/* #undef HAVE_MEMORY_H */

/* Define to 1 if you have the <readline/history.h> header file. */
#define HAVE_READLINE_HISTORY_H 1

/* Define to 1 if you have the <readline/readline.h> header file. */
#define HAVE_READLINE_READLINE_H 1

/* Define to 1 if you have the <stdint.h> header file. */
/* #undef HAVE_STDINT_H */

/* Define to 1 if you have the <stdlib.h> header file. */
/* #undef HAVE_STDLIB_H */

/* Define to 1 if you have the <strings.h> header file. */
/* #undef HAVE_STRINGS_H */

/* Define to 1 if you have the <string.h> header file. */
/* #undef HAVE_STRING_H */

/* Define to 1 if you have the <sys/epoll.h> header file. */
#define HAVE_SYS_EPOLL_H 1

/* Define to 1 if you have the <sys/eventfd.h> header file. */
#define HAVE_SYS_EVENTFD_H 1

/* Define to 1 if you have the <sys/inotify.h> header file. */
#define HAVE_SYS_INOTIFY_H 1

/* Define to 1 if you have the <sys/signalfd.h> header file. */
#define HAVE_SYS_SIGNALFD_H 1

/* Define to 1 if you have the <sys/stat.h> header file. */
/* #undef HAVE_SYS_STAT_H */

/* Define to 1 if you have the <sys/types.h> header file. */
/* #undef HAVE_SYS_TYPES_H */

/* Define to 1 if you have the <unistd.h> header file. */
/* #undef HAVE_UNISTD_H */

/* Use delta compression. */
/* #undef HBICT_DELTACOMP */

/* Name of package */
#define PACKAGE "dmtcp"

/* Define to the address where bug reports for this package should be sent. */
#define PACKAGE_BUGREPORT "dmtcp-forum@lists.sourceforge.net"

/* Define to the full name of this package. */
#define PACKAGE_NAME "DMTCP"

/* Define to the full name and version of this package. */
#define PACKAGE_STRING "DMTCP 2.3.1"

/* Define to the one symbol short name of this package. */
#define PACKAGE_TARNAME "dmtcp"

/* Define to the home page for this package. */
#define PACKAGE_URL "http://dmtcp.sourceforge.net"

/* Define to the version of this package. */
#define PACKAGE_VERSION "2.3.1"

/* No output, not even NOTE and WARNING */
/* #undef QUIET */

/* Define to 1 if you have the ANSI C header files. */
/* #undef STDC_HEADERS */

/* Record timing information to stderr and jtimings.csv */
/* #undef TIMING */

/* Use unique filenames for checkpoint images */
/* #undef UNIQUE_CHECKPOINT_FILENAMES */

/* Version number of package */
#define VERSION "2.3.1"
