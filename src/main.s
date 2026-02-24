WRITE equ 0x1
EXIT equ 0x3C

section .data
    msg db 'Hello, world!', 0xA, 0x0    ; set msg variable

section .text
    global _start

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

strlen:
    mov rdx, 0          ; Initialize the counter to 0

.loop:
    cmp byte [rdi], 0   ; Verify if the current character is 0
    je .end             ; If equal to 0, then jump to .end
    inc rdx             ; Otherwise, increment the counter
    inc rdi             ; Move to the next character
    jmp .loop           ; Call the loop

.end:
    ret                 ; End of the function
