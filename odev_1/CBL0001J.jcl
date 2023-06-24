//DACTJ JOB 1,NOTIFY=&SYSUID
//***************************************************/
//* Copyright Contributors to the COBOL Programming Course
//* SPDX-License-Identifier: CC-BY-4.0
//***************************************************/
//COBRUN  EXEC IGYWCL
//COBOL.SYSIN  DD DSN=&SYSUID..CBL(DACT),DISP=SHR
//LKED.SYSLMOD DD DSN=&SYSUID..LOAD(DACT),DISP=SHR
//***************************************************/
// IF RC = 0 THEN
//***************************************************/
//RUN     EXEC PGM=DACT
//STEPLIB   DD DSN=&SYSUID..LOAD,DISP=SHR
//ACCTREC   DD DSN=&SYSUID..DATA,DISP=SHR
//PRTLINE   DD DSN=&SYSUID..DACT.OUTPUT,DISP=(NEW,CATLG,DELETE),
//            SPACE=(CYL,(15,5))
//*            SPACE=(TRK,(20,20),RLSE),
//*           DCB=(RECFM=FB,LRECL=150,BLKSIZE=27900),UNIT=3390
//SYSOUT    DD SYSOUT=*,OUTLIM=15000
//CEEDUMP   DD DUMMY
//SYSUDUMP  DD DUMMY
//***************************************************/
// ELSE
// ENDIF
