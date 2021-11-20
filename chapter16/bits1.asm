extern printb
extern printf

section .data

	msgn1 db "Number 1",10,0
	msgn2 db "Number 2",10,0
	msg1 db "xor",10,0
	msg2 db "or",10,0
	msg3 db "and",10,0
	msg4 db "not number 1",10,0
	msg5 db "shl 2 lower byte of number 1",10,0
	msg6 db "shr 2 lower byte of number 1",10,0
	msg7 db "sal 2 lower byte of number 1",10,0

	msg8 db "sar 2 lower byte of number 1",10,0
	msg9 db "rol 2 lower byte of number 1",10,0
	msg10 db "rol 2 lower byte of number 2",10,0
	msg11 db "ror 2 lower byte of number 1",10,0
	msg12 db "ror 2 lower byte of number 2",10,0
	number1 dq -72
	number2 dq 1064

section .bss
section .text
global main
main:
push rbp
mov rbp,rsp
sub rsp,8
;print number1
mov rsi,msgn1
call printmsg
mov rdi,[number1]
call printb

;print number2

mov rsi,msgn2
call printmsg
mov rdi,[number2]
call printb

;print xor
mov rsi,msg1
call printmsg
;xor and print
mov rax,[number1]
xor rax,[number2]
mov rdi,rax
call printb

;print or
mov rsi,msg2
call printmsg

mov rax,[number1]
or rax,[number2]
mov rsi,rax
call printb

;print and
mov rsi,msg3
call printmsg

mov rax,[number1]
and rax,[number2]
mov rsi,rax
call printb

;print not
mov rsi,msg4
call printmsg

mov rax,[number1]
not rax
mov rsi,rax
call printb

;print shift left
mov rsi,msg5
call printmsg

mov rax,[number1]
shl al,2
mov rdi,rax
call printb

;print shift right
mov rsi,msg6
call printmsg
mov rax,[number1]
shr al,2
mov rdi,rax
call printb

;print shift arithmetic left
mov rsi,msg7
call printmsg

mov rax,[number1]
sal al,2
mov rdi,rax
call printb

;pirnt shift arithmetic right
mov rsi,msg8
call printmsg

mov rax,[number1]
sar al,2
mov rdi,rax
call printb

;print rotate left
mov rsi,msg9
rol al,2
mov rdi,rax
call printb
mov rsi,msg10
call printmsg
mov rax,[number2]
rol al,2
mov rdi,rax
call printb

;print rotate left
mov rsi,msg11
call printmsg
;ror and print
mov rax,[number1]
ror al,2
mov rdi,rax
call printb
mov rsi,msg12
call printmsg
mov rax,[number2]
ror al,2
mov rdi,rax
call printb
add rsp,8
leave
ret

printmsg:
section .data
	.fmtstr db "%s",0
section .text
	mov rdi,.fmtstr
	mov rax,0
	call printf
	ret

