SECTION .text
global  ft_strlen

ft_strlen:
	push	rdi
	mov		rax, rdi

strlen_nextchar:
	cmp		byte [rax], 0
	jz		strlen_finished
	inc		rax
	jmp		strlen_nextchar

strlen_finished:
	sub		rax, rdi
	pop rdi
	ret

