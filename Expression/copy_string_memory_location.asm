; Code for PROGRAM TO TRANSFER A STRING FROM ONE MEMORY LOCATION TO ANOTHER in Assembly Language
READ MACRO MSG
    MOV AH,0AH
    LEA DX,MSG
    INT 21H
ENDM
    
PRINT MACRO MSG
    MOV AH,09H
    LEA DX,MSG
    INT 21H
ENDM

DATA SEGMENT
    CR EQU 0DH
    LF EQU 0AH
    MSG1 DB "ENTER STRING:$"
    MSG2 DB "CONTENTS ARE TRANSFERRED $"
    BUFF DB 255
             DB 0
             DB 255 DUP ('$')
    DEST DB 255 DUP ('$')
DATA ENDS

CODE SEGMENT
    ASSUME CS:CODE,DS:DATA
START:  MOV AX,DATA
        MOV DS,AX
        PRINT MSG1
        READ BUFF
        MOV SI,OFFSET BUFF+2
        MOV DI,OFFSET BUFF
        MOV CL,BYTEPTR[SI+1]
        MOV CH,00H
        CLD

REPEAT: MOVSB
        PRINT MSG2
        PRINT DEST
        MOV AH,4CH
        INT 21H

CODE ENDS

END START