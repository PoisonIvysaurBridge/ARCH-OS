%include "io.inc"
extern _printf,_gets
section.data
ECHO db 0x0,0x1,0x2,'A', 0xFF
FOUND db 0xee
ADDR db 0xee
section .text
global CMAIN
CMAIN:
    mov ebp, esp; for correct debugging
   ; mov byte [FOUND],0xff
    ;mov byte [ADDR],0xff
    lea esi,[ECHO]
L1: mov al,[esi]
    cmp al,0xff
    je end
    cmp al, 'A'
    je virus
    inc esi
    jmp L1
    
virus: mov byte [FOUND],00
       mov byte [ADDR],00
end:

;push esi
;call_printf
;add esp,4
    xor eax, eax
    ret