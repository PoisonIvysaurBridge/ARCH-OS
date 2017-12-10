%include "io.inc"

section .text
global CMAIN
CMAIN:
    mov ebp, esp; for correct debugging
    mov eax, 0xab040002
    mov edi, 0x1234989f
    sub eax, edi
    mov eax, eax