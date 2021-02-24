SECTION	.text
global	ft_strcmp

ft_strcmp:
		mov		r12, 0

cmpchar:
		mov		r13b, byte [rdi + r12]
		sub		r13b, [rsi + r12]
		jne		finished
		cmp		byte [rdi + r12], 0
		jz		finished
		cmp		byte [rsi + r12], 0
		jz		finished
		inc		r12
		jmp		cmpchar

finished:
		movsx rax, r13b
		ret




