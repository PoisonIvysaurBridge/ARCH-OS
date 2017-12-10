%include "io.inc"

section .text
global CMAIN
CMAIN:
    mov ebp, esp; for correct debugging
    mov edx, 12345678
    mov eax, 0xfffffffe
    imul eax
    ret