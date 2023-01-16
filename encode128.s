; #-----------------------------------------------#
; # author: Jan Szachno, 310982                   #
; # semester: 22Z                                 #
; # project: Code 128 - barcode generation, set C #
; #-----------------------------------------------#

        section .data ; This data is initialized, but can be modified.
    ; test:   times 4 db 0xab
    ERROR_INVALID_INPUT: equ 1

    WIDTH:              equ 600
    HEIGHT:             equ 50
    BYTES_PER_PIXEL:    equ 3
    HEADER_SIZE:        equ 54

    MAX_NUM_VALUES:     equ 21
    ASCII_DIGIT_OFFSET: equ 48
    START_SYMBOL:       equ 105
    STOP_SYMBOL:        equ 106
    BYTES_PER_CODE:     equ 6
    ; Accessing particular pattern digit:
    ; address = index * BYTES_PER_CODE * 4 + position * 4
    patterns:
        db 2, 1, 2, 2, 2, 2 ; 00
        db 2, 2, 2, 1, 2, 2 ; 01
        db 2, 2, 2, 2, 2, 1 ; 02
        db 1, 2, 1, 2, 2, 3 ; 03
        db 1, 2, 1, 3, 2, 2 ; 04
        db 1, 3, 1, 2, 2, 2 ; 05
        db 1, 2, 2, 2, 1, 3 ; 06
        db 1, 2, 2, 3, 1, 2 ; 07
        db 1, 3, 2, 2, 1, 2 ; 08
        db 2, 2, 1, 2, 1, 3 ; 09
        db 2, 2, 1, 3, 1, 2 ; 10
        db 2, 3, 1, 2, 1, 2 ; 11
        db 1, 1, 2, 2, 3, 2 ; 12
        db 1, 2, 2, 1, 3, 2 ; 13
        db 1, 2, 2, 2, 3, 1 ; 14
        db 1, 1, 3, 2, 2, 2 ; 15
        db 1, 2, 3, 1, 2, 2 ; 16
        db 1, 2, 3, 2, 2, 1 ; 17
        db 2, 2, 3, 2, 1, 1 ; 18
        db 2, 2, 1, 1, 3, 2 ; 19
        db 2, 2, 1, 2, 3, 1 ; 20
        db 2, 1, 3, 2, 1, 2 ; 21
        db 2, 2, 3, 1, 1, 2 ; 22
        db 3, 1, 2, 1, 3, 1 ; 23
        db 3, 1, 1, 2, 2, 2 ; 24
        db 3, 2, 1, 1, 2, 2 ; 25
        db 3, 2, 1, 2, 2, 1 ; 26
        db 3, 1, 2, 2, 1, 2 ; 27
        db 3, 2, 2, 1, 1, 2 ; 28
        db 3, 2, 2, 2, 1, 1 ; 29
        db 2, 1, 2, 1, 2, 3 ; 30
        db 2, 1, 2, 3, 2, 1 ; 31
        db 2, 3, 2, 1, 2, 1 ; 32
        db 1, 1, 1, 3, 2, 3 ; 33
        db 1, 3, 1, 1, 2, 3 ; 34
        db 1, 3, 1, 3, 2, 1 ; 35
        db 1, 1, 2, 3, 1, 3 ; 36
        db 1, 3, 2, 1, 1, 3 ; 37
        db 1, 3, 2, 3, 1, 1 ; 38
        db 2, 1, 1, 3, 1, 3 ; 39
        db 2, 3, 1, 1, 1, 3 ; 40
        db 2, 3, 1, 3, 1, 1 ; 41
        db 1, 1, 2, 1, 3, 3 ; 42
        db 1, 1, 2, 3, 3, 1 ; 43
        db 1, 3, 2, 1, 3, 1 ; 44
        db 1, 1, 3, 1, 2, 3 ; 45
        db 1, 1, 3, 3, 2, 1 ; 46
        db 1, 3, 3, 1, 2, 1 ; 47
        db 3, 1, 3, 1, 2, 1 ; 48
        db 2, 1, 1, 3, 3, 1 ; 49
        db 2, 3, 1, 1, 3, 1 ; 50
        db 2, 1, 3, 1, 1, 3 ; 51
        db 2, 1, 3, 3, 1, 1 ; 52
        db 2, 1, 3, 1, 3, 1 ; 53
        db 3, 1, 1, 1, 2, 3 ; 54
        db 3, 1, 1, 3, 2, 1 ; 55
        db 3, 3, 1, 1, 2, 1 ; 56
        db 3, 1, 2, 1, 1, 3 ; 57
        db 3, 1, 2, 3, 1, 1 ; 58
        db 3, 3, 2, 1, 1, 1 ; 59
        db 3, 1, 4, 1, 1, 1 ; 60
        db 2, 2, 1, 4, 1, 1 ; 61
        db 4, 3, 1, 1, 1, 1 ; 62
        db 1, 1, 1, 2, 2, 4 ; 63
        db 1, 1, 1, 4, 2, 2 ; 64
        db 1, 2, 1, 1, 2, 4 ; 65
        db 1, 2, 1, 4, 2, 1 ; 66
        db 1, 4, 1, 1, 2, 2 ; 67
        db 1, 4, 1, 2, 2, 1 ; 68
        db 1, 1, 2, 2, 1, 4 ; 69
        db 1, 1, 2, 4, 1, 2 ; 70
        db 1, 2, 2, 1, 1, 4 ; 71
        db 1, 2, 2, 4, 1, 1 ; 72
        db 1, 4, 2, 1, 1, 2 ; 73
        db 1, 4, 2, 2, 1, 1 ; 74
        db 2, 4, 1, 2, 1, 1 ; 75
        db 2, 2, 1, 1, 1, 4 ; 76
        db 4, 1, 3, 1, 1, 1 ; 77
        db 2, 4, 1, 1, 1, 2 ; 78
        db 1, 3, 4, 1, 1, 1 ; 79
        db 1, 1, 1, 2, 4, 2 ; 80
        db 1, 2, 1, 1, 4, 2 ; 81
        db 1, 2, 1, 2, 4, 1 ; 82
        db 1, 1, 4, 2, 1, 2 ; 83
        db 1, 2, 4, 1, 1, 2 ; 84
        db 1, 2, 4, 2, 1, 1 ; 85
        db 4, 1, 1, 2, 1, 2 ; 86
        db 4, 2, 1, 1, 1, 2 ; 87
        db 4, 2, 1, 2, 1, 1 ; 88
        db 2, 1, 2, 1, 4, 1 ; 89
        db 2, 1, 4, 1, 2, 1 ; 90
        db 4, 1, 2, 1, 2, 1 ; 91
        db 1, 1, 1, 1, 4, 3 ; 92
        db 1, 1, 1, 3, 4, 1 ; 93
        db 1, 3, 1, 1, 4, 1 ; 94
        db 1, 1, 4, 1, 1, 3 ; 95
        db 1, 1, 4, 3, 1, 1 ; 96
        db 4, 1, 1, 1, 1, 3 ; 97
        db 4, 1, 1, 3, 1, 1 ; 98
        db 1, 1, 3, 1, 4, 1 ; 99
        db 1, 1, 4, 1, 3, 1 ; 100 (CODE B)
        db 3, 1, 1, 1, 4, 1 ; 101 (CODE A)
        db 4, 1, 1, 1, 3, 1 ; 102 (CODE FNC 1)
        db 2, 1, 1, 4, 1, 2 ; 103 (Start A)
        db 2, 1, 1, 2, 1, 4 ; 104 (Start B)
        db 2, 1, 1, 2, 3, 2 ; 105 (Start C)
        db 2, 3, 3, 1, 1, 1, 2 ; 106 (Stop)

        section .bss ; This is automatically initialized to zero, meaning the contents don't need to be stored explicitly.
    values:         resb MAX_NUM_VALUES
    print_buffer:   resb 7

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

    mov     byte cl, [edi]
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
    mov     [values+ebx], al

    inc     ebx

    jmp     parse_loop

    invalid_string:
    mov     eax, ERROR_INVALID_INPUT
    jmp     fin

end_parse_loop:

    ; example use of decode_symbol
    ; push    STOP_SYMBOL
    ; call    decode_symbol
    ; add     esp, 4
    ; movzx   eax, byte [print_buffer+6]

    ; push    dword [ebp+8]
    ; push    5
    ; push    5
    ; call    set_pixel
    ; add     esp, 12

    ; push    dword [ebp+8]
    ; push    5
    ; call    draw_line
    ; add     esp, 8

; void draw_bar(int x, int width, unsigned char *dest_bitmap)
    push    dword [ebp+8]
    push    50
    push    100
    call    draw_bar
    add     esp, 12
    
    mov     eax, 0 ; Return without errors

fin:
    pop     edi
    pop     esi
    pop     edx
    pop     ecx
    pop     ebx

    pop     ebp

    ret

; void decode_symbol(int symbol)
; decodes the given symbol and saves it into the print buffer
decode_symbol:
    push    ebp
    mov     ebp, esp

    push    ebx
    push    ecx
    push    edx
    push    esi
    push    edi
decode_symbol_main:
    ; calculate where in memory the decoded pattern is stored
    ; address = symbol * BYTES_PER_CODE + position
    mov     eax, [ebp+8]
    mov     edi, BYTES_PER_CODE
    mul     edi
    mov     ecx, eax ; base pattern address

    mov     ebx, 0 ; loop counter
decode_loop:
    cmp     ebx, 6
    jae     end_decode_loop
    mov     esi, ebx
    add     esi, ecx
    movzx   edx, byte [patterns+esi]
    mov     [print_buffer+ebx], dl
    inc     ebx
    jmp     decode_loop
end_decode_loop:

    mov     [print_buffer+6], byte 0

    cmp     [ebp+8], dword STOP_SYMBOL
    jne     decode_symbol_fin

stop_code:
    mov     esi, ebx
    add     esi, ecx
    movzx   edx, byte [patterns+esi]
    mov     [print_buffer+ebx], dl

decode_symbol_fin:
    pop     edi
    pop     esi
    pop     edx
    pop     ecx
    pop     ebx

    pop     ebp

    ret



; void draw_bar(int x, int width, unsigned char *dest_bitmap)
draw_bar:
    push    ebp
    mov     ebp, esp

    push    ebx
    push    ecx
    push    edx
    push    esi
    push    edi
draw_bar_main:
    mov     ecx, 0       ; loop counter
    mov     esi, [ebp+8] ; x position
draw_bar_loop:
; void draw_line(int x, unsigned char *dest_bitmap)
    cmp     ecx, [ebp+12]      ; while (counter < width)
    ja      end_draw_bar_loop
    push    dword [ebp+16] ; *dest_bitmap
    push    esi  ; x position
    call    draw_line
    add     esp, 8

    inc     esi
    inc     ecx
    jmp     draw_bar_loop
end_draw_bar_loop:
draw_bar_fin:
    pop     edi
    pop     esi
    pop     edx
    pop     ecx
    pop     ebx

    pop     ebp

    ret



; void draw_line(int x, unsigned char *dest_bitmap)
draw_line:
    push    ebp
    mov     ebp, esp

    push    ebx
    push    ecx
    push    edx
    push    esi
    push    edi
draw_line_main:
    mov     ecx, 5       ; loop counter (start at y=5)
draw_line_loop:
    cmp     ecx, 45      ; go up to y=45
    ja      end_draw_line_loop
    push    dword [ebp+12] ; *dest_bitmap
    push    ecx            ; y position
    push    dword [ebp+8]  ; x position
    call    set_pixel
    add     esp, 12

    inc     ecx
    jmp     draw_line_loop
end_draw_line_loop:

draw_line_fin:
    pop     edi
    pop     esi
    pop     edx
    pop     ecx
    pop     ebx

    pop     ebp

    ret



; void set_pixel(int x, int y, unsigned char *dest_bitmap)
set_pixel:
    push    ebp
    mov     ebp, esp

    push    ebx
    push    ecx
    push    edx
    push    esi
    push    edi
set_pixel_main:
    mov     edx, [ebp+8] ; x position
    imul    edx, BYTES_PER_PIXEL

    mov     ebx, WIDTH
    mov     ecx, [ebp+12] ; y position
    imul    ebx, BYTES_PER_PIXEL
    imul    ebx, ecx

    add     ebx, edx

    mov     eax, [ebp+16]
    add     ebx, eax
    add     ebx, HEADER_SIZE

    mov     edx, 0x00000000 ; 0x00RRGGBB
    mov     [ebx], dx
    shr     edx, 16         ; 0x000000RR
    mov     [ebx + 2], dl

set_pixel_fin:
    pop     edi
    pop     esi
    pop     edx
    pop     ecx
    pop     ebx

    pop     ebp

    ret
