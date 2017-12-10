; AUTHOR : Group 7 Asanza, Lim, Tan
; DATE: July 25, 2016
; Program Description: MP for Word Count
%include "io.inc"
extern _printf, _gets

section .data
str1 times 40 db 0x0
ask db "Please enter a sentence.", 13, 10, 0
xword dd 0x0    ; int is 32 
print db "Number of words: %d", 0
pNull db "There's no sentence.", 13, 10, 0
pPeriod db "Invalid terminator for the program.", 13, 10, 0
pChar db "Overloaded characters. Maximum of 40.", 13, 10, 0
checkWord dd 0x0
section .text

global CMAIN

CMAIN:
    mov ebp, esp; for correct debugging
    
    push ask
    call printf
    add esp, 4
    
    push str1
    call _gets
    add esp, 4
        
    lea edx, [str1]
    
    xor ecx, ecx
    
    CharacterCount:
        mov ah, [edx + ecx]
        cmp ah, ''
        je CheckNull
        inc ecx
        jmp CharacterCount
    
    CheckNull:
        cmp byte [edx], 0x0 ; checks if there the input is blank 
        jne CheckMax
        
        push pNull
        call printf
        add esp, 4
        
        jmp end
    
    CheckMax:
        cmp ecx, 0x28        ; 40 in hex
        jle CheckPeriod
        
        push pChar
        call printf
        add esp, 4
        
        jmp end
        
    CheckPeriod:
        cmp byte [edx + ecx - 0x1], '.'
        je startSpace
     
        push pPeriod
        call printf
        add esp, 4
        
        jmp end
    
    startSpace:     ; checks if there are spaces before the first word in the sentence. If true decrements xword.
        cmp byte [str1], ' '
        jne repeat
        dec byte [xword]
            
    repeat:
        mov al, [edx]
        cmp al, '.'
        je done
        cmp al, ' '
        jne increment
        cmp byte [edx + 1], ' '
        je increment
        inc byte [xword] 
        
    increment:
        inc edx
        jmp repeat
      
    done:
        cmp ecx, 0x1
        je end
        inc byte [xword]
        cmp byte [edx - 1], ' '
        je endSpace
        jmp end
    
    endSpace: ;checks if there are spaces after the first word in the sentence. If true decrements xword.
        dec byte [xword]
        
    end:
        push dword [xword]
        push print
        call printf
        add esp, 8
    
    
    
    xor eax, eax
    ret
    
    ; some test cases
    
    ; Input                    correct Output            Output so far
    
    ; abc.123                  1 word                    invalid terminator
    ;    spaces   .            1 word
    ; spaces     between.      2 words
    ;  space i space  .        3 words
    ;                          null input 0 words
    ; lkjsaf1234               invalid terminator
    ; <41 chars including '.'> overload max
    ; normal string of words.  4 words
    ; .                        0 words
    ; .<space/s>               0 words                   invalid terminator
    ; <space/s>                0 words
    