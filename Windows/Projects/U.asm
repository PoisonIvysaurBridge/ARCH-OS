%include "io.inc"

section .text
global CMAIN
CMAIN:
    mov ebp, esp; for correct debugging
    mov ebx, 0004
    sub ebx, 0005
    dec ebx
    mov ebx,ebx