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
    16                                  
    17 00000004 BB00000000              	mov rbx,0 ;counter
    18 00000009 B800000000              	mov rax,0 ;sum
    19                                  jloop:
    20 0000000E 4801D8                  	add rax,rbx
    21 00000011 48FFC3                  	inc rbx
    22 00000014 483B1C25[00000000]      	cmp rbx,[number]
    23 0000001C 7EF0                    	jle jloop ;number not reached, loop again
    24                                  
    25 0000001E 48BF-                   	mov rdi,fmt
    25 00000020 [0800000000000000] 
    26 00000028 488B3425[00000000]      	mov rsi,[number]
    27 00000030 4889C2                  	mov rdx,rax
    28 00000033 B800000000              	mov rax,0
    29 00000038 E8(00000000)            	call printf
    30                                  
    31 0000003D 4889EC                  	mov rsp,rbp
    32 00000040 5D                      	pop rbp
    33 00000041 C3                      	ret
