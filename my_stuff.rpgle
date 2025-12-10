**FREE
DCL-C FALSE '0';
DCL-C TRUE '1';

DCL-C LF x'25';
DCL-C CR x'0D';
DCL-C NULL x'00';

DCL-PR WriteToJoblog INT(10) EXTPROC('Qp0zLprintf');
    *n POINTER VALUE OPTIONS(*STRING);
    *n POINTER VALUE OPTIONS(*STRING:*NOPASS);
    // you can repeat the second parm more if desired
END-PR;
