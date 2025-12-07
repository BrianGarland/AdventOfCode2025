**FREE

CTL-OPT MAIN(Main) BNDDIR('QC2LE') DFTACTGRP(*NO) ACTGRP(*NEW);

/INCLUDE 'ifs_io.rpgle'
/INCLUDE 'my_stuff.rpgle'
/INCLUDE 'errno_h.rpgle'

DCL-PR Main EXTPGM('DAY1PART1');
    pfilename CHAR(32);
END-PR;




DCL-PROC Main;
    DCL-PI *N;
        pfilename CHAR(32);
    END-PI;

    DCL-S answer        INT(20);
    DCL-S buffer        CHAR(150);
    DCL-S bufferlen     INT(10);
    DCL-S filename      VARCHAR(100);
    DCL-S message       CHAR(50);
    DCL-S options       VARCHAR(100);
    DCL-S stream        LIKE(pfile);
    DCL-S success       POINTER;

    DCL-S dialposition  UNS(5);

    DCL-S moves         INT(5) DIM(50000);



    // Read the input
    filename = './builds/AdventOfCode2025/Day1/' + %TRIM(pfilename);
    options = 'r, crln=N';
    stream = fopen(filename:options);
    IF stream = *NULL;
        message = 'ERRNO: ' + %CHAR(errno()) 
                + ' File: ' + filename;
        DSPLY message;
        RETURN;
    ENDIF;
    CLEAR buffer;
    success = fgets(%ADDR(buffer):%SIZE(buffer):stream);
    DOW success <> *NULL;
        bufferlen = %LEN(%TRIMR(buffer));
        DOW bufferlen > 0
            AND (%SUBST(buffer:bufferlen:1) = x'00'
                 OR %SUBST(buffer:bufferlen:1) = x'0D'
                 OR %SUBST(buffer:bufferlen:1) = x'25');
            bufferlen -= 1;
        ENDDO;





        CLEAR buffer;
        success = fgets(%ADDR(buffer):%SIZE(buffer):stream);
    ENDDO;

    fclose(stream);





    DSPLY %CHAR(answer);

    RETURN;

END-PROC;

/DEFINE ERRNO_LOAD_PROCEDURE
/INCLUDE 'errno_h.rpgle'
