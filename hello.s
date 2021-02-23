SECTION .data
msg     db      'Hello World babyyy!', 10
 
SECTION .text
global  _start
 
_start:
	mov		rax, msg
	call	ft_strlen

	mov		rdi, 1
	mov		rsi, msg
	mov		rdx, rax
	mov		rax, 1
	syscall

	mov		rax, 60
	mov		rdi, 0
	syscall

ft_strlen:
	push	rdi
	mov		rdi, rax

nextchar:
	cmp		byte [rax], 0
	jz		finished
	inc		rax
	jmp		nextchar

finished:
	sub		rax, rdi
	pop rdi
	ret

