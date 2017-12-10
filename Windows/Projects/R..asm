%include "io.inc"

section .text
global CMAIN
CMAIN:
    mov ebp, esp; for correct debugging
    mov edi, 0x1234989f
    mov ebx, 0x00000004
    add edi, ebx
    mov edi, edi