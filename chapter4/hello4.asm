
extern printf ;declare function as external


section .data

	msg db "hello world",0
	fmtstr db "this is our string: %s",10,0; printformat

section .bss
section .text
	global main
main:
	push rbp
	mov rbp,rsp
	mov rdi,fmtstr ;first argument for printf
	mov rsi,msg ;second argument for printf
	mov rax,0 ;no xmm registers involved
	call printf
	
	mov rsp,rbp
	pop rbp
	mov rax,60
	mov rdi,0
	syscall
