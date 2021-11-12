

section .data

    msg db "hello, world",0
    NL db 0xa ;ascii code for new line

section .bss

section .text

    global main

main:
    mov rax, 1 ;write
    mov rdi,1 ;stdout
    mov rsi,msg
    mov rdx,12 ;length of the string
    syscall

    mov rax,1 ;write
    mov rdi,1 ;stdout
    mov rsi, NL ;new line
    mov rdx,1 ;display string
    syscall

    mov rax,60 ;exit
    mov rdi,0  ;success exit code
    syscall