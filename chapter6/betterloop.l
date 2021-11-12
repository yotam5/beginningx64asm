     1                                  extern printf
     2                                  
     3                                  section .data
     4                                  
     5 00000000 0500000000000000        	number dq 5
     6 00000008 7468652073756D2066-     	fmt db "the sum from 0 to %ld is %ld",10,0
     6 00000011 726F6D203020746F20-
     6 0000001A 256C6420697320256C-
     6 00000023 640A00             
     7                                  
     8                                  section .bss
     9                                  section .text
    10                                  
    11                                  	global main
    12                                  
    13                                  main:
    14 00000000 55                      	push rbp
    15 00000001 4889E5                  	mov rbp,rsp
    16 00000004 488B0C25[00000000]      	mov rcx,[number]
    17 0000000C B800000000              	mov rax,0
    18                                  bloop:
    19 00000011 4801C8                  	add rax,rcx
    20 00000014 E2FB                    	loop bloop
    21                                  
    22 00000016 48BF-                   	mov rdi,fmt
    22 00000018 [0800000000000000] 
    23 00000020 488B3425[00000000]      	mov rsi,[number]
    24 00000028 4889C2                  	mov rdx,rax
    25 0000002B B800000000              	mov rax,0
    26 00000030 E8(00000000)            	call printf
    27 00000035 4889EC                  	mov rsp,rbp
    28 00000038 5D                      	pop rbp
    29 00000039 C3                      	ret
