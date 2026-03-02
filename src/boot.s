[bits 16]
org 0x7C00

start:
    xor ax, ax
    mov ds, ax
    mov es, ax

    mov ah, 0x0E
    mov bx, msg
    call print_string
    jmp $

print_string:
    mov al, [bx]
    cmp al, 0
    je end_print
    int 0x10
    inc bx
    jmp print_string

end_print:
    ret

msg db 'Hello Boot', 0

times 510-($-$$) db 0
dw 0xAA55
