        section .data ; This data is initialized, but can be modified.
        ; test:   times 4 db 0xab
    ; etc...

        section .rodata ; This data can't be modified, which lets it be shared across copies of the program.
    MAX_NUM_VALUES:     equ 40
    ASCII_DIGIT_OFFSET: equ 48
    ; etc...

        section .bss ; This is automatically initialized to zero, meaning the contents don't need to be stored explicitly.
    values:     resb MAX_NUM_VALUES
    ; etc...

        section .text
    ; int encode128(unsigned char *dest_bitmap, int bar_width, char *text)
    global  encode128
encode128:
    push    ebp
    mov     ebp, esp

    push    ebx
    push    ecx
    push    edx
    push    esi
    push    edi

    ; mov     eax, [ebp+8]    ; dest_bitmap
    ; mov     esi, [ebp+12]   ; bar_width
    mov     edi, [ebp+16]   ; text

main:
    ; Parse user input. Turn string of characters into vector of bytes containing two digit numbers
    mov     ebx, values ; pointer to parsed values in memory
    ; edi is pointer to input passed by user

parse_loop:
    mov      byte ch, [edi]
    cmp     byte [edi], 0 ; Check if we reached end of user input
    je      end_parse_loop ; If yes, stop parsing the string
    inc     edi

    mov      byte cl, [edi]
    cmp     byte [edi], 0 ; Check if we reached null character
    je      invalid_string ; If null character, it means we have an odd number of characters
    inc     edi

    ; Convert ascii symbols into digits
    sub     ch, ASCII_DIGIT_OFFSET
    sub     cl, ASCII_DIGIT_OFFSET

    ; Check if the input was numeric
    cmp     byte ch, 0
    jb      invalid_string
    cmp     byte ch, 9
    ja      invalid_string
    cmp     byte cl, 0
    jb      invalid_string
    cmp     byte cl, 9
    ja      invalid_string

    ; Combine the digits into a number
    movzx     eax, ch
    mov     edx, 10
    mul     edx
    movzx   edx, cl
    add     eax, edx

    ; jmp     parse_loop

    invalid_string:

end_parse_loop:
    
    
    ; mov     esi, values
    ; mov     byte [esi], 3
    ; inc     esi
    ; mov     byte [esi], 7

fin:
    ; mov     eax, 0

    pop     edi
    pop     esi
    pop     edx
    pop     ecx
    pop     ebx

    pop     ebp

    ret
