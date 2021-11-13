extern printf


section .data
    number1 dq 128
    number2 dq 19
    neg_num dq -12
    fmt db "the numbers are %ld and %ld",10,0
    fmtint db "%s %ld",10,0
    sumi db "the sum is",0
    difi db "the difference is",0
    inci db "number 1 increamented",0
    deci db "number 1 decrementeed",0
    sali db "number 1 shift left2 (x4) :",0
    sari db "number 1 shift right 2 (/4) :",0
    sariex db "number 1 shift right 2 (/2) with "
        db "sign externsion :",0
    multi db "the product is :",0
    divi db "the integer quotient is",0
    remi db "the modulo is",0

section .bss
    resulti resq 1
        modulo resq 1

section .text
    global main

main:
    push rbp
    mov rbp,rsp

    ;displaying the numbers
    mov rdi,fmt
    mov rsi,[number1]
    mov rdx,[number2]
    mov rax,0
    call printf

    ;adding
    mov rax,[number1]
    add rax,[number2] ;add number3 to rax
    mov [resulti],rax ;move sum to result
    ;displaying the result
    mov rdi,fmtint
    mov rsi,sumi
    mov rdx,[resulti]
    mov rax,0
    call printf

    ;substracting
    mov rax,[number1]
    sub rax,[number2] ;substruct number2 from rax
    mov [resulti],rax
    ;display the result
    mov rdi,fmtint
    mov rsi,difi
    mov rdx,[resulti]
    mov rax,0
    call printf

    ;incrementing
    mov rax,[number1]
    inc rax
    mov [resulti],rax
    ;display the result
    mov rdi,fmtint
    mov rsi,inci
    mov rdx,[resulti]
    mov rax,0
    call printf

    ;decrementing
    mov rax,[number1]
    dec rax
    ;display the result
    mov rdi,fmtint
    mov rsi,deci
    mov rdx,[resulti]
    mov rax,0
    call printf

    ;shift arithmetic left
    mov rax,[number1]
    sal rax,2 ;multiply rax by 4
    mov [resulti],rax
    ;displaying the result
    mov rdi,fmtint
    mov rsi,sali
    mov rdx,[resulti]
    mov rax,0
    call printf

    ;shift arithmetic right
    mov rax,[number1]
    sar rax,2 ;divide rax by 4
    mov [resulti],rax
    ;dispalying the result
    mov rdi,fmtint
    mov rsi,sari
    mov rdx,[resulti]
    mov rax,0
    call printf

    ;shift arithmetic with sign externsion
    mov rax,[neg_num]
    sar rax,2 ;divide rax by 4
    mov [resulti],rax
    ;displaying the result
    mov rdi,fmtint
    mov rsi,sariex
    mov rdx,[resulti]
    mov rax,0
    call printf

    ;multiply
    mov rax,[number1]
    imul qword [number2] ;mul rax with number2
    mov [resulti],rax
    ;display the result
    mov rdi,fmtint
    mov rsi,multi
    mov rdx,[resulti]
    mov rax,0
    call printf

    ;divide
    mov rax,[number1]
    mov rdx,0 ;rdx needs 0 before idiv
    idiv qword [number2] ;divide rax by number2 modulo
    mov [modulo],rdx
    ;displaying the result
    mov rsi,divi
    mov rdi,fmtint
    mov rdx,[resulti]
    mov rax,0
    call printf

    mov rdi,fmtint
    mov rsi,remi
    mov rdx,[modulo]
    mov rax,0
    call printf

    mov rsp,rbp
    pop rbp
    ret

