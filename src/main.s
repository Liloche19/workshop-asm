EXIT equ 0x3C
WRITE equ 0x1

section .text
    global _start

_start:
    mov rax, WRITE      ; Write system call
    mov rdi, 1          ; File descriptor for stdout
    mov rsi, msg        ; Message to print
    mov rdx, msg_len    ; Length of message
    syscall             ; Invoke system call

    mov rax, EXIT       ; Exit system call
    mov rdi, 0          ; Exit code 0
    syscall             ; Invoke system call

section .data
msg db 'Hello, world!', 0xA         ; set msg variable
msg_len equ $ - msg                 ; set the msg_len to the length of msg
