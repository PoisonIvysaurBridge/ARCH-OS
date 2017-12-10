; (2) numbers are initially reverse sorted
%include "io.inc"
section .data
TWENTY dd 20,19,18,17,16,15,14,13,12,11,10,9,8,7,6,5,4,3,2,1,127
before db "Before:", 13, 10, 0
print db "%d", 13,10,0
after db "After:", 13, 10, 0
section .text
global CMAIN
CMAIN:
       mov ebp, esp; for correct debugging
       
       push before
       call printf
       add esp, 4
       
       push dword [TWENTY]
       push print
       call printf
       add esp, 8
       
       lea esi, [TWENTY]
OUTER: mov eax, [esi]
       cmp al, 127
       je done
       lea edi,[TWENTY]
INNER: mov ebx, [edi]
       cmp bl, 127
       je L1
       mov ecx, [edi + 1]
       cmp bl, cl
       jle L2
     ; swapping ###########
       xchg bl,cl
       mov [edi],bl
       mov [edi + 1],cl
     ; ####################
L2:    inc edi
       jmp INNER
L1:    inc esi
       jmp OUTER     
done: 
    
       push after
       call printf
       add esp, 4
       
       push dword [TWENTY]
       push print
       call printf
       add esp, 8
    
    xor eax, eax
    ret