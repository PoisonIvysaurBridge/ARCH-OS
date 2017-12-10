%include "io.inc"
section.data
SAGOT db 
BETA dd 0x12345678
section .text
global CMAIN
CMAIN:
    mov ebp, esp; for correct debugging
    mov byte [SAGOT],00
    lea edi, [BETA]