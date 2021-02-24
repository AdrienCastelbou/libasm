SECTION	.text
global	ft_strcmp

ft_strcmp:
			push	rdi
			push	rsi
			mov		rax, 0
cmpchar:
			mov		dl, byte [rdi]
			mov		cl, byte [rsi]
			cmp		dl, cl
			jz		finished
			inc		rdi
			inc		rsi
			jmp		cmpchar
finished:
			sub		dl, cl
			mov		rax, rdx
			pop		rsi
			pop		rdi
			ret

