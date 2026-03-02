[bits 16]
org 0x7C00

start:
    xor ax, ax
    mov ds, ax
    mov es, ax
    mov ss, ax
    mov sp, 0x7C00

    mov ah, 0x0E
    mov bx, msg
    call print_string
    call check_stack
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

check_stack:
    xor ax, ax
    mov ax, 0x6767
    push ax
    xor ax, ax
    pop ax
    cmp ax, 0x6767
    mov ah, 0x0E
    je stack_ok
    mov al, 'F'
    int 0x10
    ret

stack_ok:
    mov al, 'S'
    int 0x10
    ret

msg db 'Hello Boot', 0

times 510-($-$$) db 0
dw 0xAA55
