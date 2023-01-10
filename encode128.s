                section .text
        global  encode128
encode128:
        push    ebp
        mov     ebp, esp

fin:
        mov     eax, 13
        pop     ebp
        ret
