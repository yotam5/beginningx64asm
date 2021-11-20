    
    section .data
        msg db "Hello, World!",0,10

    section .bss
    section .text
        global main

    main:
        mov rax, 1 ;write
        mov rdi,1 ;stdout
        mov rsi,msg
        mov rdx,15 ;length of the string
        syscall

        mov rax,60 ;exit
        mov rdi,0  ;exit code
        syscall

        
