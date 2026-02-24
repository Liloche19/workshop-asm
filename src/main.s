WRITE equ 0x1
EXIT equ 0x3C

section .data
    msg db 'Hello, world!', 0xA, 0x0    ; set msg variable

section .text
    global _start
    extern strlen

_start:
    lea rdi, [msg]      ; Message to compute the length
    call strlen         ; Calculate the length of the message

    mov rax, WRITE      ; Write system call
    mov rsi, msg        ; Message to print
    mov rdi, 1          ; File descriptor for stdout
    syscall             ; Invoke system call

    mov rax, EXIT       ; Exit system call
    mov rdi, 0          ; Exit code 0
    syscall             ; Invoke system call
