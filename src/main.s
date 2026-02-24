section .text
    global _start

_start:
    mov rax, 0x3C   ; Exit system call
    mov rdi, 0      ; Exit code 0
    syscall         ; Invoke system call
