**FREE

CTL-OPT MAIN(Main) BNDDIR('QC2LE') DFTACTGRP(*NO) ACTGRP(*NEW);

/INCLUDE 'ifs_io.rpgle'
/INCLUDE 'my_stuff.rpgle'
/INCLUDE 'errno_h.rpgle'

DCL-PR Main EXTPGM('DAY1PART2');
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
    DCL-S message       VARCHAR(100);
    DCL-S options       VARCHAR(100);
    DCL-S stream        LIKE(pfile);
    DCL-S success       POINTER;

    DCL-S dialposition  INT(5) INZ(50);
    DCL-S direction     CHAR(1);    
    DCL-S distance      INT(10);
    DCL-S maxdialpos    UNS(5) INZ(99);
    DCL-S mindialpos    UNS(5) INZ(0);
    DCL-S numpositions  UNS(5) INZ(100);
    DCL-S numzeros      UNS(5) INZ(0);



    message = '- The dial starts by pointing at ' + %CHAR(dialposition) + '.' + LF;
    WriteToJoblog(message);

    // Read the input
    filename = './builds/AdventOfCode2025/Day1/' + %TRIM(pfilename);
    options = 'r, crln=N';
    stream = fopen(filename:options);
    IF stream = *NULL;
        message = 'ERRNO: ' + %CHAR(errno()) 
                + ' File: ' + filename;
        WriteToJoblog(message);
        RETURN;
    ENDIF;
    CLEAR buffer;
    success = fgets(%ADDR(buffer):%SIZE(buffer):stream);
    DOW success <> *NULL;
        bufferlen = %LEN(%TRIMR(buffer));
        DOW bufferlen > 0
            AND (%SUBST(buffer:bufferlen:1) = NULL
                 OR %SUBST(buffer:bufferlen:1) = CR
                 OR %SUBST(buffer:bufferlen:1) = LF);
            bufferlen -= 1;
        ENDDO;

        direction = %SUBST(buffer:1:1);
        distance = %INT(%SUBST(buffer:2:bufferlen-1));
        numzeros = 0;

        IF direction = 'R';
            dialposition += distance;
            DOW dialposition > maxdialpos;
                dialposition -= numpositions;
                numzeros += 1;
            ENDDO;
            IF dialposition = 0 AND numzeros > 0;
                numzeros -= 1;
            ENDIF;
        ELSEIF direction = 'L';
            IF dialposition = 0;
                dialposition = 100;
            ENDIF;
            dialposition -= distance;
            DOW dialposition < mindialpos;
                dialposition += numpositions;
                numzeros += 1;
            ENDDO;
        ENDIF;

        message = '- The dial is rotated ' + direction + %CHAR(distance)
                + ' to point at ' + %CHAR(dialposition);
        IF numzeros > 0; 
            message += ';  During this rotation, it points at zero ' 
                     + %CHAR(numzeros) + ' time(s).' + LF;
        ELSE;
            message += '.' + LF;
        ENDIF;                
        WriteToJoblog(message);

        answer += numzeros;
        IF dialposition = 0;
            answer += 1;
        ENDIF;

        message = '  Current total is ' + %CHAR(answer) + '.' + LF;
        WriteToJoblog(message);

        CLEAR buffer;
        success = fgets(%ADDR(buffer):%SIZE(buffer):stream);
    ENDDO;

    fclose(stream);

    message = 'The password is ' + %CHAR(answer) + '.' + LF;
    WriteToJoblog(message);

    RETURN;

END-PROC;

/DEFINE ERRNO_LOAD_PROCEDURE
/INCLUDE 'errno_h.rpgle'
