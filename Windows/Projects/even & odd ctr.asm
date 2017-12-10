%include "io.inc"
section.data
evenctr db 
oddctr db
start db 0x1,0x2,0x3,0x4,0x5,0x6,0xff
section .text
global CMAIN
CMAIN:
    mov ebp, esp; for correct debugging
    mov byte [evenctr],00
    mov byte [oddctr],00
    lea esi, [start]
    xor eax, eax
    xor ebx,ebx
 repeat:mov bl,[esi]
        cmp bl,0xff
        je end
        mov al,0x2
        div bl
        cmp ah,00
        jne L1
        inc byte[evenctr]
        jmp L2
    L1: inc byte[oddctr]
    L2: inc esi
        jmp repeat
    end:
    ret