**FREE

// ERRNO_H --  Header file for working with C-Runtime and
//     UNIX-Type API error handling routines.
//
//  To use this:
//       1)  put a /COPY ERRNO_H in the D-specs of your program.
//       2)  put a "/define ERRNO_LOAD_PROCEDURE", followed by a
//               2nd "/COPY ERRNO_H" somewhere that procedures
//               are allowed to be defined :)
//       3)  bind to the QC2LE binding directory.
//
//
/IF NOT DEFINED(ERRNO_LOAD_PROCEDURE)
                                                                                             
//-------------------------------------------------------------------
// error constant definitions
//-------------------------------------------------------------------
                                                                                    
// these values come originally from file QCLE/H member ERRNO
                                                                  
// domain error in math function
DCL-C EDOM       3001;
// range error in math function
DCL-C ERANGE     3002;
// truncation on I/O operation
DCL-C ETRUNC     3003;
// file has not been opened
DCL-C ENOTOPEN   3004;
// file not opened for read
DCL-C ENOTREAD   3005;
// file opened for record I/O
DCL-C ERECIO     3008;
// file not opened for write
DCL-C ENOTWRITE  3009;
// stdin cannot be opened
DCL-C ESTDIN     3010;
// stdout cannot be opened
DCL-C ESTDOUT    3011;
// stderr cannot be opened
DCL-C ESTDERR    3012;
// bad offset to seek to
DCL-C EBADSEEK   3013;
// invalid file name specified
DCL-C EBADNAME   3014;
// invalid file mode specified
DCL-C EBADMODE   3015;
// invalid position specifier
DCL-C EBADPOS    3017;
// no record at specified position
DCL-C ENOPOS     3018;
// no ftell if more than 1 member
DCL-C ENUMMBRS   3019;
// no ftell if too many records
DCL-C ENUMRECS   3020;
// invalid function pointer
DCL-C EBADFUNC   3022;
// record not found
DCL-C ENOREC     3026;
// message data invalid
DCL-C EBADDATA   3028;
// bad option on I/O function
DCL-C EBADOPT    3040;
// file not opened for update
DCL-C ENOTUPD    3041;
// file not opened for delete
DCL-C ENOTDLT    3042;
// padding occurred on write operation
DCL-C EPAD       3043;
// bad key length option
DCL-C EBADKEYLN  3044;
// illegal write after read
DCL-C EPUTANDGET 3080;
// illegal read after write
DCL-C EGETANDPUT 3081;
// I/O exception non-recoverable error
DCL-C EIOERROR   3101;
// I/O exception recoverable error
DCL-C EIORECERR  3102;

// The following were taken from QSYSINC/SYS ERRNO:
                                                                     
//  Permission denied.
DCL-C EACCES     3401;
//  Not a directory.
DCL-C ENOTDIR    3403;
//  No space available.
DCL-C ENOSPC     3404;
//  Improper link.
DCL-C EXDEV      3405;
//  Operation would have caused the process
DCL-C EWOULDBLOCK 3406;
//  Operation would have caused the process
DCL-C EAGAIN     3406;
//  Interrupted function call.
DCL-C EINTR      3407;
//  The address used for an argument was no
DCL-C EFAULT     3408;
//  Operation timed out
DCL-C ETIME      3409;
//  No such device or address
DCL-C ENXIO      3415;
//  Socket closed
DCL-C ECLOSED    3417;
//  Address already in use.
DCL-C EADDRINUSE 3420;
//  Address not available.
DCL-C EADDRNOTAVAIL 3421;
//  The type of socket is not supported in
DCL-C EAFNOSUPPORT 3422;
//  Operation already in progress.
DCL-C EALREADY   3423;
//  Connection ended abnormally.
DCL-C ECONNABORTED 3424;
//  A remote host refused an attempted conn
DCL-C ECONNREFUSED 3425;
//  A connection with a remote socket was r
DCL-C ECONNRESET 3426;
//  Operation requires destination address.
DCL-C EDESTADDRREQ 3427;
//  A remote host is not available.
DCL-C EHOSTDOWN  3428;
//  A route to the remote host is not avail
DCL-C EHOSTUNREACH 3429;
//  Operation in progress.
DCL-C EINPROGRESS 3430;
//  A connection has already been establish
DCL-C EISCONN    3431;
//  Message size out of range.
DCL-C EMSGSIZE   3432;
//  The network is not currently available.
DCL-C ENETDOWN   3433;
//  A socket is connected to a host that is
DCL-C ENETRESET  3434;
//  Cannot reach the destination network.
DCL-C ENETUNREACH 3435;
//  There is not enough buffer space for th
DCL-C ENOBUFS    3436;
//  The protocol does not support the speci
DCL-C ENOPROTOOPT 3437;
//  Requested operation requires a connecti
DCL-C ENOTCONN   3438;
//  The specified descriptor does not refer
DCL-C ENOTSOCK   3439;
//  Operation not supported.
DCL-C ENOTSUP    3440;
//  Operation not supported.
DCL-C EOPNOTSUPP 3440;
//  The socket protocol family is not suppo
DCL-C EPFNOSUPPORT 3441;
//  No protocol of the specified type and d
DCL-C EPROTONO   3442;
//  The socket type or protocols are not co
DCL-C EPROTOTYPE 3443;
//  An error indication was sent by the pee
DCL-C ERCVDERR   3444;
//  Cannot send data after a shutdown.
DCL-C ESHUTDOWN  3445;
//  The specified socket type is not suppor
DCL-C ESOCKTNO   3446;
//  A remote host did not respond within th
DCL-C ETIMEDOUT  3447;
//  The protocol required to support the sp
DCL-C EUNATCH    3448;
//  Descriptor not valid.
DCL-C EBADF      3450;
//  Too many open files for this process.
DCL-C EMFILE     3452;
//  Too many open files in the system.
DCL-C ENFILE     3453;
//  Broken pipe.
DCL-C EPIPE      3455;
//  File exists.
DCL-C EEXIST     3457;
//  Resource deadlock avoided.
DCL-C EDEADLK    3459;
//  Storage allocation request failed.
DCL-C ENOMEM     3460;
//  The synchronization object no longer ex
DCL-C EOWNERTERM 3462;
// The synchronization object was destroyed
DCL-C EDESTROYED 3463;
//  Operation terminated.
DCL-C ETERM      3464;
//  Maximum link count for a file was excee
DCL-C EMLINK     3468;
//  Seek request not supported for object.
DCL-C ESPIPE     3469;
//  Function not implemented.
DCL-C ENOSYS     3470;
//  Specified target is a directory.
DCL-C EISDIR     3471;
//  Read-only file system.
DCL-C EROFS      3472;
//  Unknown system state.
DCL-C EUNKNOWN   3474;
//  Iterator is invalid.
DCL-C EITERBAD   3475;
//  A damaged object was encountered.
DCL-C EDAMAGE    3484;
//  A loop exists in the symbolic links.
DCL-C ELOOP      3485;
//  A path name is too long.
DCL-C ENAMETOOLONG 3486;
//  No locks available
DCL-C ENOLCK     3487;
//  Directory not empty.
DCL-C ENOTEMPTY  3488;
//  System resources not available to compl
DCL-C ENOSYSRSC  3489;
//  Conversion error.
DCL-C ECONVERT   3490;
//  Argument list too long.
DCL-C E2BIG      3491;
//  Conversion stopped due to input charact
DCL-C EILSEQ     3492;
// Object has soft damage.
DCL-C ESOFTDAMAGE 3497;
//  User not enrolled in system distributio
DCL-C ENOTENROLL 3498;
//  Object is suspended.
DCL-C EOFFLINE   3499;
// Object is a read only object.
DCL-C EROOBJ     3500;
// Area being read from or written to is lo
DCL-C ELOCKED    3506;
// Object too large.
DCL-C EFBIG      3507;
// The semaphore, shared memory, or message
DCL-C EIDRM      3509;
// The queue does not contain a message of
DCL-C ENOMSG     3510;
// File ID conversion of a directory failed
DCL-C EFILECVT   3511;
// A File ID could not be assigned when lin
DCL-C EBADFID    3512;
// A File ID could not be assigned when lin
DCL-C ESTALE     3513;
// No such process.
DCL-C ESRCH      3515;
// Process not enabled for signals.
DCL-C ENOTSIGINIT 3516;
// No child process.
DCL-C ECHILD     3517;
// The operation would have exceeded the ma
DCL-C ETOOMANYREFS 3523;
// Function not allowed.
DCL-C ENOTSAFE   3524;
// Object is too large to process.
DCL-C EOVERFLOW  3525;
// Journal damaged.
DCL-C EJRNDAMAGE 3526;
// Journal inactive.
DCL-C EJRNINACTIVE 3527;
// Journal space or system storage error.
DCL-C EJRNRCVSPC 3528;
// Journal is remote.
DCL-C EJRNRMT    3529;
// New journal receiver is needed.
DCL-C ENEWJRNRCV 3530;
// New journal is needed.
DCL-C ENEWJRN    3531;
// Object already journaled.
DCL-C EJOURNALED 3532;
// Entry too large to send.
DCL-C EJRNENTTOOLONG 3533;
// Object is a Datalink object.
DCL-C EDATALINK  3534;
                                                                             
// The following values are defined by POSIX ISO/IEC 9945-1:1990
// (these were also taken from QCLE/H member ERRNO)
                                                                  
// invalid argument
DCL-C EINVAL     3021;
// input/output error
DCL-C EIO        3006;
// no such device
DCL-C ENODEV     3007;
// resource busy
DCL-C EBUSY      3029;
// no such file or library
DCL-C ENOENT     3025;
// operation not permitted
DCL-C EPERM      3027;



//-------------------------------------------------------------------
// prototype definitions
//-------------------------------------------------------------------
DCL-PR sys_errno POINTER EXTPROC('__errno');
END-PR;
                                                                                     
DCL-PR strerror POINTER EXTPROC('strerror');
    errnum INT(10) VALUE;
END-PR;
                                                                                     
DCL-PR perror EXTPROC('perror');
    comment POINTER VALUE OPTIONS(*STRING);
END-PR;
                                                                                     
DCL-PR errno INT(10);
END-PR;

/ENDIF


//-------------------------------------------------------------------
// procedure definitions:
//-------------------------------------------------------------------
/IF DEFINED(ERRNO_LOAD_PROCEDURE)

// Retrieve the C-language "errno" (error number)
DCL-PROC errno;
    DCL-PI *n INT(10);
    END-PI;

    DCL-S p_errno  POINTER;
    DCL-S wwreturn INT(10) BASED(P_ERRNO);

    p_errno = sys_errno();

    RETURN WWRETURN;

END-PROC;
                                                                       
/ENDIF
                                                                                   