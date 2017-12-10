%include "io.inc"

section .text
global CMAIN
CMAIN:
    mov byte [ECHO], 00
    lea esi, [ECHO]

L1: mov al,[esi]
    lea bl,[al] ; bl gets the address of al
    cmp al, 0xFF
    je end

    cmp al, 'A'
    jne L2
    mov byte[FOUND], 00
    mov byte[ADDRESS],bl
    jmp tapos

L2: inc esi
     jmp L1
end: mov byte[FOUND], 0xFFFF
tapos:
