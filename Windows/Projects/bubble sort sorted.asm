;  (1) numbers are initially sorted
%include "io.inc"
section .data
TWENTY db 1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,99 ;99 acts as sentinel
section .text
global CMAIN
CMAIN:
       mov ebp, esp; for correct debugging
       ;lea esi, [TWENTY]
       mov al, 00
OUTER: cmp al, 20
       je done
       lea edi,[TWENTY]
INNER: mov bl, [edi]
       cmp bl, 99
       je L1
       mov cl, [edi + 1]
       cmp bl, cl
       jle L2
     ; swapping ###########
       mov dl, bl
       mov bl, cl
       mov cl, dl
       mov [edi],bl
       mov [edi + 1],cl
     ; ####################
L2:    inc edi
       jmp INNER
L1:    inc al
       jmp OUTER     
done: 
    
    
    
    xor eax, eax
    ret