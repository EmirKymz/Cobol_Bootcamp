       IDENTIFICATION DIVISION.

       PROGRAM-ID.    PBEG0005.
       AUTHOR.        EMIRCAN KAYMAZ.

       ENVIRONMENT DIVISION.

       INPUT-OUTPUT SECTION.
       FILE-CONTROL.
           SELECT PRINT-LINE ASSIGN PRTLINE
                             STATUS PRT-ST.
           SELECT ACCT-REC   ASSIGN ACCTREC
                             STATUS ACCT-ST.
       DATA DIVISION.

       FILE SECTION.
       FD  PRINT-LINE RECORDING MODE F.
       01  PRINT-REC.
           05  PRINT-INX            PIC X(04).
           05  PRINT-NAMES          PIC X(15).
           05  PRINT-SURNAMES       PIC X(15).
           05  PRINT-BDATE          PIC 9(08).
           05  PRINT-TODAY          PIC 9(08).
           05  PRINT-SPACE          PIC X(5) VALUE SPACES.
           05  PRINT-DIFF           PIC 9(05).

       FD  ACCT-REC RECORDING MODE F.
       01  ACCT-FIELDS.
           05  ACCT-INX            PIC X(04).
           05  ACCT-NAMES          PIC X(15).
           05  ACCT-SURNAMES       PIC X(15).
           05  ACCT-BDATE          PIC 9(08).
           05  ACCT-TODAY          PIC 9(08).

       WORKING-STORAGE SECTION.
       01  WS-WORK-AREA.
           05 PRT-ST         PIC 9(02).
              88 PRT-SUCCESS           VALUE 00 97.
           05 ACCT-ST        PIC 9(02).
              88 ACCT-EOF              VALUE 10.
              88 ACCT-SUCCESS          VALUE 00 97.
           05 DATE-INT      PIC 9(07).
           05 NDATE-INT     PIC 9(07).

       PROCEDURE DIVISION.
       0000-MAIN.
           PERFORM H100-OPEN-FILES.
           PERFORM H200-PROCESS UNTIL ACCT-EOF.
           PERFORM H999-PROGRAM-EXIT.

       H100-OPEN-FILES.
           OPEN INPUT  ACCT-REC.
           OPEN OUTPUT PRINT-LINE.
           READ ACCT-REC.
       H100-END. EXIT.

       H200-PROCESS.
           COMPUTE DATE-INT = FUNCTION INTEGER-OF-DATE(ACCT-BDATE)
           COMPUTE NDATE-INT = FUNCTION INTEGER-OF-DATE(ACCT-TODAY)
           INITIALIZE PRINT-REC
           MOVE ACCT-INX        TO PRINT-INX
           MOVE ACCT-NAMES      TO PRINT-NAMES
           MOVE ACCT-SURNAMES   TO PRINT-SURNAMES
           MOVE ACCT-BDATE      TO PRINT-BDATE
           MOVE ACCT-TODAY      TO PRINT-TODAY
           COMPUTE PRINT-DIFF = NDATE-INT - DATE-INT
           WRITE PRINT-REC.
           READ ACCT-REC.
       H200-END. EXIT.
       H300-CLOSE-FILES.
           CLOSE ACCT-REC
                 PRINT-LINE.
       H300-END. EXIT.

       H999-PROGRAM-EXIT.
           PERFORM H300-CLOSE-FILES.
           STOP RUN.
       H999-END. EXIT.
