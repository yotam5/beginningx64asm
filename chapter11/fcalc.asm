extern printf


section .data
	number1 dq 9.0
	number2 dq 73.0
	fmt     db "the numbers are %f and %f",10,0

	fmt_float db "%s %f",10,0
	f_sum db "the float sum of %f and %f is %f",10,0
	f_diff db "the float difference of %f and %f is %f",10,0
	f_mul db "the float mul of %f and %f is %f",10,0
	f_div db "the float div of %f and %f is %f",10,0
	f_sqrt db "the float sqrt of %f is %f",10,0

section .bss
section .text

	global main

main:
	push rbp
	mov rbp,rsp
	;print the numbers
	movsd xmm0,[number1]
	movsd xmm1,[number2]

	mov rdi,fmt
	mov rax,2 ;two floats
	call printf

	;sum
	movsd xmm2,[number1]
	addsd xmm2,[number2] ;double precision to xmm
	;print result
	movsd xmm0,[number1]
	movsd xmm1,[number2]
	mov rdi,f_sum
	mov rax,3 ;three floats
	call printf

	;difference
	movsd xmm2,[number1]
	subsd xmm2,[number2]
	;print the result
	movsd xmm0,[number1]
	movsd xmm1,[number2];
	mov rdi,f_diff
	mov rax,3 ;three floats
	call printf

	;multiplication
	movsd xmm2,[number1]
	mulsd xmm2,[number2]

	;print the result
	movsd xmm0,[number1]
	movsd xmm1,[number2]
	mov rax,3 ;three floats
	call printf

	;division
	movsd xmm2,[number1]
	divsd xmm2,[number2] ;divide xmm0
	;print the result
	mov rdi,f_div
	movsd xmm0,[number1]
	movsd xmm1,[number2]
	mov rax,1 ;one float
	call printf

	;sqaure root
	sqrtsd xmm1,[number1]
	;print the result
	mov rdi,f_sqrt
	movsd xmm0,[number1]
	mov rax,2 ;2 floats
	call printf

	;exit
	mov rsp,rbp
	pop rbp
	ret


