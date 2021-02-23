SECTION .data
msg     db      'Hello World babyyy!', 10
 
SECTION .text
global  ft_strlen

ft_strlen:
	push	rdi
	mov		rax, rdi

nextchar:
	cmp		byte [rax], 0
	jz		finished
	inc		rax
	jmp		nextchar

finished:
	sub		rax, rdi
	pop rdi
	ret

