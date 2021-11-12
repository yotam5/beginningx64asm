
section .data

	msg1 db "hello world",0
	msg2 db "alive and kicking",0
	radius dd 357
	pi dq 3.14
	fmtstr db "%s",10,0 ;foramt for printing a string
	fmtflt db "%lf",10,0 ;format for a float
	fmtint db "%d",10,0 ;format for an integer

section .bss

section .text

extern printf

	global main

main:
	push rbp
	mov rbp,rsp

	;print msg1
	mov rax,0 ;no floating point
	mov rdi,fmtstr
	mov rsi,msg1
	call printf

	;print msg2
	mov rax,0
	mov rdi,fmtstr
	mov rdi,msg2
	call printf

	;print radius
	mov rax,0
	mov rdi, fmtint
	mov rsi,[radius]
	call printf

	;print pie
	mov rax,1 ;1 xmm register used
	movq xmm0, [pi]
	call printf

	mov rsp,rbp
	pop rbp
	ret

