%include "io.inc"

section .text
global CMAIN
CMAIN:
    ;write your code here
    xor eax, eax
    ret
    
    
    
    
    
    
    
    http://www.crsr.net/Notes/BigO.html#id10
    
    
    
    push before
       call printf
       add esp, 4
       
       push dword [TWENTY]
       push print
       call printf
       add esp, 8