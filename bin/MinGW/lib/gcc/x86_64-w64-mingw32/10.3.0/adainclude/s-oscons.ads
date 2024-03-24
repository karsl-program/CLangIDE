------------------------------------------------------------------------------
--                                                                          --
--                         GNAT COMPILER COMPONENTS                         --
--                                                                          --
--                  S Y S T E M . O S _ C O N S T A N T S                   --
--                                                                          --
--                                 S p e c                                  --
--                                                                          --
--          Copyright (C) 2000-2019, Free Software Foundation, Inc.         --
--                                                                          --
-- GNAT is free software;  you can  redistribute it  and/or modify it under --
-- terms of the  GNU General Public License as published  by the Free Soft- --
-- ware  Foundation;  either version 3,  or (at your option) any later ver- --
-- sion.  GNAT is distributed in the hope that it will be useful, but WITH- --
-- OUT ANY WARRANTY;  without even the  implied warranty of MERCHANTABILITY --
-- or FITNESS FOR A PARTICULAR PURPOSE.                                     --
--                                                                          --
-- As a special exception under Section 7 of GPL version 3, you are granted --
-- additional permissions described in the GCC Runtime Library Exception,   --
-- version 3.1, as published by the Free Software Foundation.               --
--                                                                          --
-- You should have received a copy of the GNU General Public License and    --
-- a copy of the GCC Runtime Library Exception along with this program;     --
-- see the files COPYING3 and COPYING.RUNTIME respectively.  If not, see    --
-- <http://www.gnu.org/licenses/>.                                          --
--                                                                          --
-- GNAT was originally developed  by the GNAT team at  New York University. --
-- Extensive contributions were provided by Ada Core Technologies Inc.      --
--                                                                          --
------------------------------------------------------------------------------

pragma Style_Checks ("M32766");
--  Allow long lines

--  This package provides target dependent definitions of constant for use
--  by the GNAT runtime library. This package should not be directly with'd
--  by an application program.

--  This file is generated automatically, do not modify it by hand! Instead,
--  make changes to s-oscons-tmplt.c and rebuild the GNAT runtime library.
--  This is the version for x86_64-w64-mingw32

with Interfaces.C;
with System.Win32;
package System.OS_Constants is

   pragma Pure;

   ---------------------------------
   -- General platform parameters --
   ---------------------------------

   type OS_Type is (Windows, Other_OS);
   Target_OS                     : constant OS_Type := Windows;
   pragma Warnings (Off, Target_OS);
   --  Suppress warnings on Target_OS since it is in general tested for
   --  equality with a constant value to implement conditional compilation,
   --  which normally generates a constant condition warning.

   Target_Name                   : constant String  := "x86_64-w64-mingw32";
   SIZEOF_unsigned_int           : constant := 4;           --  Size of unsigned int
   subtype Serial_Port_Descriptor is System.Win32.HANDLE;

   -------------------
   -- System limits --
   -------------------

   IOV_MAX                       : constant := 2147483647;  --  Maximum writev iovcnt
   NAME_MAX                      : constant := 260;         --  Maximum file name length

   ---------------------
   -- File open modes --
   ---------------------

   O_RDWR                        : constant := 2;           --  Read/write
   O_NOCTTY                      : constant := -1;          --  Don't change ctrl tty
   O_NDELAY                      : constant := -1;          --  Nonblocking

   ----------------------
   -- Fcntl operations --
   ----------------------

   F_GETFL                       : constant := -1;          --  Get flags
   F_SETFL                       : constant := -1;          --  Set flags

   -----------------
   -- Fcntl flags --
   -----------------

   FNDELAY                       : constant := -1;          --  Nonblocking

   ----------------------
   -- Ioctl operations --
   ----------------------

   subtype IOCTL_Req_T is Interfaces.C.int;
   FIONBIO                       : constant := -2147195266; --  Set/clear non-blocking io
   FIONREAD                      : constant := 1074030207;  --  How many bytes to read

   ------------------
   -- Errno values --
   ------------------

   --  The following constants are defined from <errno.h>

   EAGAIN                        : constant := 11;          --  Try again
   ENOENT                        : constant := 2;           --  File not found
   ENOMEM                        : constant := 12;          --  Out of memory

   --  The following constants are defined from <winsock2.h> (WSA*)

   EACCES                        : constant := 10013;       --  Permission denied
   EADDRINUSE                    : constant := 10048;       --  Address already in use
   EADDRNOTAVAIL                 : constant := 10049;       --  Cannot assign address
   EAFNOSUPPORT                  : constant := 10047;       --  Addr family not supported
   EALREADY                      : constant := 10037;       --  Operation in progress
   EBADF                         : constant := 10009;       --  Bad file descriptor
   ECONNABORTED                  : constant := 10053;       --  Connection aborted
   ECONNREFUSED                  : constant := 10061;       --  Connection refused
   ECONNRESET                    : constant := 10054;       --  Connection reset by peer
   EDESTADDRREQ                  : constant := 10039;       --  Destination addr required
   EFAULT                        : constant := 10014;       --  Bad address
   EHOSTDOWN                     : constant := 10064;       --  Host is down
   EHOSTUNREACH                  : constant := 10065;       --  No route to host
   EINPROGRESS                   : constant := 10036;       --  Operation now in progress
   EINTR                         : constant := 10004;       --  Interrupted system call
   EINVAL                        : constant := 10022;       --  Invalid argument
   EIO                           : constant := 10101;       --  Input output error
   EISCONN                       : constant := 10056;       --  Socket already connected
   ELOOP                         : constant := 10062;       --  Too many symbolic links
   EMFILE                        : constant := 10024;       --  Too many open files
   EMSGSIZE                      : constant := 10040;       --  Message too long
   ENAMETOOLONG                  : constant := 10063;       --  Name too long
   ENETDOWN                      : constant := 10050;       --  Network is down
   ENETRESET                     : constant := 10052;       --  Disconn. on network reset
   ENETUNREACH                   : constant := 10051;       --  Network is unreachable
   ENOBUFS                       : constant := 10055;       --  No buffer space available
   ENOPROTOOPT                   : constant := 10042;       --  Protocol not available
   ENOTCONN                      : constant := 10057;       --  Socket not connected
   ENOTSOCK                      : constant := 10038;       --  Operation on non socket
   EOPNOTSUPP                    : constant := 10045;       --  Operation not supported
   EPIPE                         : constant := 32;          --  Broken pipe
   EPFNOSUPPORT                  : constant := 10046;       --  Unknown protocol family
   EPROTONOSUPPORT               : constant := 10043;       --  Unknown protocol
   EPROTOTYPE                    : constant := 10041;       --  Unknown protocol type
   ERANGE                        : constant := 34;          --  Result too large
   ESHUTDOWN                     : constant := 10058;       --  Cannot send once shutdown
   ESOCKTNOSUPPORT               : constant := 10044;       --  Socket type not supported
   ETIMEDOUT                     : constant := 10060;       --  Connection timed out
   ETOOMANYREFS                  : constant := 10059;       --  Too many references
   EWOULDBLOCK                   : constant := 10035;       --  Operation would block
   E2BIG                         : constant := 7;           --  Argument list too long
   EILSEQ                        : constant := 42;          --  Illegal byte sequence

   ----------------------
   -- Terminal control --
   ----------------------

   DTR_CONTROL_ENABLE            : constant := 1;           --  Enable DTR flow ctrl
   RTS_CONTROL_ENABLE            : constant := 1;           --  Enable RTS flow ctrl

   -----------------------------
   -- Pseudo terminal library --
   -----------------------------

   PTY_Library                   : constant String  := "";            --  for g-exptty

   --------------
   -- Families --
   --------------

   AF_INET                       : constant := 2;           --  IPv4 address family
   AF_INET6                      : constant := 23;          --  IPv6 address family
   AF_UNIX                       : constant := 1;           --  Local unix family
   AF_UNSPEC                     : constant := 0;           --  Unspecified address family

   -----------------------------
   -- addrinfo fields offsets --
   -----------------------------

   AI_FLAGS_OFFSET               : constant := 0;           --  Offset of ai_flags in addrinfo
   AI_FAMILY_OFFSET              : constant := 4;           --  Offset of ai_family in addrinfo
   AI_SOCKTYPE_OFFSET            : constant := 8;           --  Offset of ai_socktype in addrinfo
   AI_PROTOCOL_OFFSET            : constant := 12;          --  Offset of ai_protocol in addrinfo
   AI_ADDRLEN_OFFSET             : constant := 16;          --  Offset of ai_addrlen in addrinfo
   AI_ADDR_OFFSET                : constant := 32;          --  Offset of ai_addr in addrinfo
   AI_CANONNAME_OFFSET           : constant := 24;          --  Offset of ai_canonname in addrinfo
   AI_NEXT_OFFSET                : constant := 40;          --  Offset of ai_next in addrinfo

   ---------------------------------------
   -- getaddrinfo getnameinfo constants --
   ---------------------------------------

   AI_PASSIVE                    : constant := 1;           --  NULL nodename for accepting
   AI_CANONNAME                  : constant := 2;           --  Get the host official name
   AI_NUMERICSERV                : constant := 8;           --  Service is a numeric string
   AI_NUMERICHOST                : constant := 4;           --  Node is a numeric IP address
   AI_ADDRCONFIG                 : constant := 1024;        --  Returns addresses for only locally configured families
   AI_V4MAPPED                   : constant := 2048;        --  Returns IPv4 mapped to IPv6
   AI_ALL                        : constant := 256;         --  Change AI_V4MAPPED behavior for unavailavle IPv6 addresses
   NI_NAMEREQD                   : constant := 4;           --  Error if the hostname cannot be determined
   NI_DGRAM                      : constant := 16;          --  Service is datagram
   NI_NOFQDN                     : constant := 1;           --  Return only the hostname part for local hosts
   NI_NUMERICSERV                : constant := 8;           --  Numeric form of the service
   NI_NUMERICHOST                : constant := 2;           --  Numeric form of the hostname
   NI_MAXHOST                    : constant := 1025;        --  Maximum size of hostname
   NI_MAXSERV                    : constant := 32;          --  Maximum size of service name
   EAI_SYSTEM                    : constant := -1;          --  Check errno for details

   ------------------
   -- Socket modes --
   ------------------

   SOCK_STREAM                   : constant := 1;           --  Stream socket
   SOCK_DGRAM                    : constant := 2;           --  Datagram socket
   SOCK_RAW                      : constant := 3;           --  Raw socket

   -----------------
   -- Host errors --
   -----------------

   HOST_NOT_FOUND                : constant := 11001;       --  Unknown host
   TRY_AGAIN                     : constant := 11002;       --  Host name lookup failure
   NO_DATA                       : constant := 11004;       --  No data record for name
   NO_RECOVERY                   : constant := 11003;       --  Non recoverable errors

   --------------------
   -- Shutdown modes --
   --------------------

   SHUT_RD                       : constant := 0;           --  No more recv
   SHUT_WR                       : constant := 1;           --  No more send
   SHUT_RDWR                     : constant := 2;           --  No more recv/send

   ---------------------
   -- Protocol levels --
   ---------------------

   SOL_SOCKET                    : constant := 65535;       --  Options for socket level
   IPPROTO_IP                    : constant := 0;           --  Dummy protocol for IP
   IPPROTO_IPV6                  : constant := 41;          --  IPv6 socket option level
   IPPROTO_UDP                   : constant := 17;          --  UDP
   IPPROTO_TCP                   : constant := 6;           --  TCP
   IPPROTO_ICMP                  : constant := 1;           --  Internet Control Message Protocol
   IPPROTO_IGMP                  : constant := 2;           --  Internet Group Management Protocol
   IPPROTO_IPIP                  : constant := -1;          --  IPIP tunnels (older KA9Q tunnels use 94)
   IPPROTO_EGP                   : constant := 8;           --  Exterior Gateway Protocol
   IPPROTO_PUP                   : constant := 12;          --  PUP protocol
   IPPROTO_IDP                   : constant := 22;          --  XNS IDP protocol
   IPPROTO_TP                    : constant := -1;          --  SO Transport Protocol Class 4
   IPPROTO_DCCP                  : constant := -1;          --  Datagram Congestion Control Protocol
   IPPROTO_RSVP                  : constant := -1;          --  Reservation Protocol
   IPPROTO_GRE                   : constant := -1;          --  General Routing Encapsulation
   IPPROTO_ESP                   : constant := 50;          --  encapsulating security payload
   IPPROTO_AH                    : constant := 51;          --  authentication header
   IPPROTO_MTP                   : constant := -1;          --  Multicast Transport Protocol
   IPPROTO_BEETPH                : constant := -1;          --  IP option pseudo header for BEET
   IPPROTO_ENCAP                 : constant := -1;          --  Encapsulation Header
   IPPROTO_PIM                   : constant := 103;         --  Protocol Independent Multicast
   IPPROTO_COMP                  : constant := -1;          --  Compression Header Protocol
   IPPROTO_SCTP                  : constant := 132;         --  Stream Control Transmission Protocol
   IPPROTO_UDPLITE               : constant := -1;          --  UDP-Lite protocol
   IPPROTO_MPLS                  : constant := -1;          --  MPLS in IP
   IPPROTO_RAW                   : constant := 255;         --  Raw IP packets

   -------------------
   -- Request flags --
   -------------------

   MSG_OOB                       : constant := 1;           --  Process out-of-band data
   MSG_PEEK                      : constant := 2;           --  Peek at incoming data
   MSG_EOR                       : constant := -1;          --  Send end of record
   MSG_WAITALL                   : constant := 8;           --  Wait for full reception
   MSG_NOSIGNAL                  : constant := -1;          --  No SIGPIPE on send
   MSG_Forced_Flags              : constant := 0;
   --  Flags set on all send(2) calls

   --------------------
   -- Socket options --
   --------------------

   TCP_NODELAY                   : constant := 1;           --  Do not coalesce packets
   SO_REUSEADDR                  : constant := 4;           --  Bind reuse local address
   SO_REUSEPORT                  : constant := -1;          --  Bind reuse port number
   SO_KEEPALIVE                  : constant := 8;           --  Enable keep-alive msgs
   SO_LINGER                     : constant := 128;         --  Defer close to flush data
   SO_BROADCAST                  : constant := 32;          --  Can send broadcast msgs
   SO_SNDBUF                     : constant := 4097;        --  Set/get send buffer size
   SO_RCVBUF                     : constant := 4098;        --  Set/get recv buffer size
   SO_SNDTIMEO                   : constant := 4101;        --  Emission timeout
   SO_RCVTIMEO                   : constant := 4102;        --  Reception timeout
   SO_ERROR                      : constant := 4103;        --  Get/clear error status
   SO_BUSY_POLL                  : constant := -1;          --  Busy polling
   IP_MULTICAST_IF               : constant := 9;           --  Set/get mcast interface
   IP_MULTICAST_TTL              : constant := 10;          --  Set/get multicast TTL
   IP_MULTICAST_LOOP             : constant := 11;          --  Set/get mcast loopback
   IP_ADD_MEMBERSHIP             : constant := 12;          --  Join a multicast group
   IP_DROP_MEMBERSHIP            : constant := 13;          --  Leave a multicast group
   IP_PKTINFO                    : constant := 19;          --  Get datagram info
   IP_RECVERR                    : constant := -1;          --  Extended reliable error message passing
   IPV6_ADDRFORM                 : constant := -1;          --  Turn IPv6 socket into different address family
   IPV6_ADD_MEMBERSHIP           : constant := 12;          --  Join IPv6 multicast group
   IPV6_DROP_MEMBERSHIP          : constant := 13;          --  Leave IPv6 multicast group
   IPV6_MTU                      : constant := -1;          --  Set/get MTU used for the socket
   IPV6_MTU_DISCOVER             : constant := -1;          --  Control path-MTU discovery on the socket
   IPV6_MULTICAST_HOPS           : constant := 10;          --  Set the multicast hop limit for the socket
   IPV6_MULTICAST_IF             : constant := 9;           --  Set/get IPv6 mcast interface
   IPV6_MULTICAST_LOOP           : constant := 11;          --  Set/get mcast loopback
   IPV6_RECVPKTINFO              : constant := -1;          --  Set delivery of the IPV6_PKTINFO
   IPV6_PKTINFO                  : constant := 19;          --  Get IPv6datagram info
   IPV6_RTHDR                    : constant := 32;          --  Set the routing header delivery
   IPV6_AUTHHDR                  : constant := -1;          --  Set the authentication header delivery
   IPV6_DSTOPTS                  : constant := -1;          --  Set the destination options delivery
   IPV6_HOPOPTS                  : constant := 1;           --  Set the hop options delivery
   IPV6_FLOWINFO                 : constant := -1;          --  Set the flow ID delivery
   IPV6_HOPLIMIT                 : constant := 21;          --  Set the hop count of the packet delivery
   IPV6_RECVERR                  : constant := -1;          --  Extended reliable error message passing
   IPV6_ROUTER_ALERT             : constant := -1;          --  Pass forwarded router alert hop-by-hop option
   IPV6_UNICAST_HOPS             : constant := 4;           --  Set the unicast hop limit
   IPV6_V6ONLY                   : constant := 27;          --  Restricted to IPv6 communications only

   ----------------------
   -- Type definitions --
   ----------------------

   --  Sizes (in bytes) of the components of struct timeval
   SIZEOF_tv_sec                 : constant := 4;           --  tv_sec
   SIZEOF_tv_usec                : constant := 4;           --  tv_usec

   --  Maximum allowed value for tv_sec
   MAX_tv_sec                    : constant := 2 ** (SIZEOF_tv_sec * 8 - 1) - 1;

   --  Sizes of various data types
   SIZEOF_sockaddr_in            : constant := 16;          --  struct sockaddr_in
   SIZEOF_sockaddr_in6           : constant := 28;          --  struct sockaddr_in6
   SIZEOF_sockaddr_un            : constant := 110;         --  struct sockaddr_un
   SIZEOF_fd_set                 : constant := 8200;        --  fd_set
   FD_SETSIZE                    : constant := 1024;        --  Max fd value
   SIZEOF_struct_hostent         : constant := 32;          --  struct hostent
   SIZEOF_struct_servent         : constant := 32;          --  struct servent
   SIZEOF_socklen_t              : constant := 8;           --  Size of socklen_t
   IF_NAMESIZE                   : constant := -1;          --  Max size of interface name with 0 terminator

   --  Fields of struct msghdr
   subtype Msg_Iovlen_T is Interfaces.C.size_t;

   ----------------------------------------
   -- Properties of supported interfaces --
   ----------------------------------------

   Need_Netdb_Buffer             : constant := 0;           --  Need buffer for Netdb ops
   Need_Netdb_Lock               : constant := 0;           --  Need lock for Netdb ops
   Has_Sockaddr_Len              : constant := 0;           --  Sockaddr has sa_len field
   Thread_Blocking_IO            : constant Boolean := True;
   --  Set False for contexts where socket i/o are process blocking

   Inet_Pton_Linkname            : constant String  := "__gnat_inet_pton";
   Inet_Ntop_Linkname            : constant String  := "__gnat_inet_ntop";

   ---------------------
   -- Threads support --
   ---------------------

   --  Clock identifier definitions

   CLOCK_REALTIME                : constant := 0;           --  System realtime clock
   CLOCK_MONOTONIC               : constant := 1;           --  System monotonic clock
   CLOCK_THREAD_CPUTIME_ID       : constant := 3;           --  Thread CPU clock
   CLOCK_RT_Ada                  : constant := CLOCK_REALTIME;

   --------------------------------
   -- File and directory support --
   --------------------------------

   SIZEOF_struct_file_attributes : constant := 32;          --  struct file_attributes
   SIZEOF_struct_dirent_alloc    : constant := 269;         --  struct dirent allocation

   ------------------------------
   -- MinGW-specific constants --
   ------------------------------

   --  These constants may be used only within the MinGW version of
   --  GNAT.Sockets.Thin.
   WSASYSNOTREADY                : constant := 10091;       --  System not ready
   WSAVERNOTSUPPORTED            : constant := 10092;       --  Version not supported
   WSANOTINITIALISED             : constant := 10093;       --  Winsock not initialized
   WSAEDISCON                    : constant := 10101;       --  Disconnected

end System.OS_Constants;
