
section .data
	msg1 db "hello world",10,0
	msg1Len equ $-msg1-1 ;measure the length minus the 0
	msg2 db "alive and kicking",10,0
	msg2Len equ $-msg2-1
	radius dq 357 ;no string, not displayable?
	pi dq 3.14

section .bss
section .text

	global main

main:
	push rbp ;function prologue
	mov rbp,rsp ;function prologue
	mov rax,1 ;write
	mov rdi,1 ;stdout
	mov rsi,msg1 ;string offset
	mov rdx,msg1Len
	syscall

	mov rax,1
	mov rdi,1
	mov rsi,msg2
	mov rdx,msg2Len
	syscall

	mov rsp,rbp ;function epilogue
	pop rbp ;function epilogue
	mov rax,60
	mov rdi,0
	syscall

