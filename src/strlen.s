section .text
    global strlen

strlen:
    xor rdx, rdx        ; Initialize the counter to 0 (lighter than: mov, rdx, 0)

.loop:
    cmp byte [rdi], 0   ; Verify if the current character is 0
    je .end             ; If equal to 0, then jump to .end
    inc rdx             ; Otherwise, increment the counter
    inc rdi             ; Move to the next character
    jmp .loop           ; Call the loop

.end:
    ret                 ; End of the function
