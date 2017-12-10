%include "io.inc"

section .text
global CMAIN
CMAIN:
    mov ebp, esp; for correct debugging
    ;write your code here
    MOV EAX, 0xAB040002
    MOV EDI,0x1234989F
    SUB eax,edi 
    