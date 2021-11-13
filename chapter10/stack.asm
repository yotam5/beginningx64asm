extern printf

section .data
	strng db "ABCDE",0
	strngLen equ $ - strng - 1; stringlength without 0
	fmt1 db "the original string: %s",10,0
	fmt2 db "the reverse string: %s",10,0

section .bss

section .text
	global main

main:
	push rbp
	mov rbp,rsp

	;print original string
	mov rdi,fmt1
	mov rsi,strng
	mov rax,0
	call printf

	;push the string char per char on the stack
	xor rax,rax
	mov rbx,strng ;address of strng
	mov rcx,strngLen ;length as counter
	mov r12,0 ;use r12 as pointer
	
	pushLoop:
		mov al, byte [rbx+r12] ;move char into rax
		push rax
		inc r12 ;increase pointer by 1
		loop pushLoop

	;pop the string char per char from the stack
	;this will reverse the original string
	mov rbx, strng ;address of rcx in rbx
	mov rcx, strngLen ;length in rcx counter
	mov r12,0
	popLoop:
		pop rax ; pop char from the stack
		mov byte [rbx+r12], al ;move the char into strng
		inc r12
		loop popLoop
		mov byte [rbx+r12],0 ;terminate string

	;print reversed string
	mov rdi,fmt2
	mov rsi,strng
	mov rax,0
	call printf

	mov rsp,rbp
	pop rbp
	ret