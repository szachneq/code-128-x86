        section .data ; This data is initialized, but can be modified.
    ; test:   times 4 db 0xab
    MAX_NUM_VALUES:     equ 80
    ASCII_DIGIT_OFFSET: equ 48
    START_SYMBOL:       equ 105
    STOP_SYMBOL:        equ 106
    ; Accessing particular pattern digit:
    ; address = index * 6 * 4 + position * 4
    patterns:
        dd 2, 1, 2, 2, 2, 2 ; 00
        dd 2, 2, 2, 1, 2, 2 ; 01
        dd 2, 2, 2, 2, 2, 1 ; 02
        dd 1, 2, 1, 2, 2, 3 ; 03
        dd 1, 2, 1, 3, 2, 2 ; 04
        dd 1, 3, 1, 2, 2, 2 ; 05
        dd 1, 2, 2, 2, 1, 3 ; 06
        dd 1, 2, 2, 3, 1, 2 ; 07
        dd 1, 3, 2, 2, 1, 2 ; 08
        dd 2, 2, 1, 2, 1, 3 ; 09
        dd 2, 2, 1, 3, 1, 2 ; 10
        dd 2, 3, 1, 2, 1, 2 ; 11
        dd 1, 1, 2, 2, 3, 2 ; 12
        dd 1, 2, 2, 1, 3, 2 ; 13
        dd 1, 2, 2, 2, 3, 1 ; 14
        dd 1, 1, 3, 2, 2, 2 ; 15
        dd 1, 2, 3, 1, 2, 2 ; 16
        dd 1, 2, 3, 2, 2, 1 ; 17
        dd 2, 2, 3, 2, 1, 1 ; 18
        dd 2, 2, 1, 1, 3, 2 ; 19
        dd 2, 2, 1, 2, 3, 1 ; 20
        dd 2, 1, 3, 2, 1, 2 ; 21
        dd 2, 2, 3, 1, 1, 2 ; 22
        dd 3, 1, 2, 1, 3, 1 ; 23
        dd 3, 1, 1, 2, 2, 2 ; 24
        dd 3, 2, 1, 1, 2, 2 ; 25
        dd 3, 2, 1, 2, 2, 1 ; 26
        dd 3, 1, 2, 2, 1, 2 ; 27
        dd 3, 2, 2, 1, 1, 2 ; 28
        dd 3, 2, 2, 2, 1, 1 ; 29
        dd 2, 1, 2, 1, 2, 3 ; 30
        dd 2, 1, 2, 3, 2, 1 ; 31
        dd 2, 3, 2, 1, 2, 1 ; 32
        dd 1, 1, 1, 3, 2, 3 ; 33
        dd 1, 3, 1, 1, 2, 3 ; 34
        dd 1, 3, 1, 3, 2, 1 ; 35
        dd 1, 1, 2, 3, 1, 3 ; 36
        dd 1, 3, 2, 1, 1, 3 ; 37
        dd 1, 3, 2, 3, 1, 1 ; 38
        dd 2, 1, 1, 3, 1, 3 ; 39
        dd 2, 3, 1, 1, 1, 3 ; 40
        dd 2, 3, 1, 3, 1, 1 ; 41
        dd 1, 1, 2, 1, 3, 3 ; 42
        dd 1, 1, 2, 3, 3, 1 ; 43
        dd 1, 3, 2, 1, 3, 1 ; 44
        dd 1, 1, 3, 1, 2, 3 ; 45
        dd 1, 1, 3, 3, 2, 1 ; 46
        dd 1, 3, 3, 1, 2, 1 ; 47
        dd 3, 1, 3, 1, 2, 1 ; 48
        dd 2, 1, 1, 3, 3, 1 ; 49
        dd 2, 3, 1, 1, 3, 1 ; 50
        dd 2, 1, 3, 1, 1, 3 ; 51
        dd 2, 1, 3, 3, 1, 1 ; 52
        dd 2, 1, 3, 1, 3, 1 ; 53
        dd 3, 1, 1, 1, 2, 3 ; 54
        dd 3, 1, 1, 3, 2, 1 ; 55
        dd 3, 3, 1, 1, 2, 1 ; 56
        dd 3, 1, 2, 1, 1, 3 ; 57
        dd 3, 1, 2, 3, 1, 1 ; 58
        dd 3, 3, 2, 1, 1, 1 ; 59
        dd 3, 1, 4, 1, 1, 1 ; 60
        dd 2, 2, 1, 4, 1, 1 ; 61
        dd 4, 3, 1, 1, 1, 1 ; 62
        dd 1, 1, 1, 2, 2, 4 ; 63
        dd 1, 1, 1, 4, 2, 2 ; 64
        dd 1, 2, 1, 1, 2, 4 ; 65
        dd 1, 2, 1, 4, 2, 1 ; 66
        dd 1, 4, 1, 1, 2, 2 ; 67
        dd 1, 4, 1, 2, 2, 1 ; 68
        dd 1, 1, 2, 2, 1, 4 ; 69
        dd 1, 1, 2, 4, 1, 2 ; 70
        dd 1, 2, 2, 1, 1, 4 ; 71
        dd 1, 2, 2, 4, 1, 1 ; 72
        dd 1, 4, 2, 1, 1, 2 ; 73
        dd 1, 4, 2, 2, 1, 1 ; 74
        dd 2, 4, 1, 2, 1, 1 ; 75
        dd 2, 2, 1, 1, 1, 4 ; 76
        dd 4, 1, 3, 1, 1, 1 ; 77
        dd 2, 4, 1, 1, 1, 2 ; 78
        dd 1, 3, 4, 1, 1, 1 ; 79
        dd 1, 1, 1, 2, 4, 2 ; 80
        dd 1, 2, 1, 1, 4, 2 ; 81
        dd 1, 2, 1, 2, 4, 1 ; 82
        dd 1, 1, 4, 2, 1, 2 ; 83
        dd 1, 2, 4, 1, 1, 2 ; 84
        dd 1, 2, 4, 2, 1, 1 ; 85
        dd 4, 1, 1, 2, 1, 2 ; 86
        dd 4, 2, 1, 1, 1, 2 ; 87
        dd 4, 2, 1, 2, 1, 1 ; 88
        dd 2, 1, 2, 1, 4, 1 ; 89
        dd 2, 1, 4, 1, 2, 1 ; 90
        dd 4, 1, 2, 1, 2, 1 ; 91
        dd 1, 1, 1, 1, 4, 3 ; 92
        dd 1, 1, 1, 3, 4, 1 ; 93
        dd 1, 3, 1, 1, 4, 1 ; 94
        dd 1, 1, 4, 1, 1, 3 ; 95
        dd 1, 1, 4, 3, 1, 1 ; 96
        dd 4, 1, 1, 1, 1, 3 ; 97
        dd 4, 1, 1, 3, 1, 1 ; 98
        dd 1, 1, 3, 1, 4, 1 ; 99
        dd 1, 1, 4, 1, 3, 1 ; 100 (CODE B)
        dd 3, 1, 1, 1, 4, 1 ; 101 (CODE A)
        dd 4, 1, 1, 1, 3, 1 ; 102 (CODE FNC 1)
        dd 2, 1, 1, 4, 1, 2 ; 103 (Start A)
        dd 2, 1, 1, 2, 1, 4 ; 104 (Start B)
        dd 2, 1, 1, 2, 3, 2 ; 105 (Start C)
        dd 2, 3, 3, 1, 1, 1, 2 ; 106 (Stop)

        section .bss ; This is automatically initialized to zero, meaning the contents don't need to be stored explicitly.
    align 1
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
    mov     ebx, 0

parse_loop:
    mov     byte ch, [edi]
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
    movzx   eax, ch
    mov     edx, 10
    mul     edx
    movzx   edx, cl
    add     eax, edx

    ; Store number in the memory
    mov     byte [values+ebx], al

    add     ebx, 4

    jmp     parse_loop

    invalid_string:

end_parse_loop:

fin:
    mov     eax, [patterns+212]

    pop     edi
    pop     esi
    pop     edx
    pop     ecx
    pop     ebx

    pop     ebp

    ret
