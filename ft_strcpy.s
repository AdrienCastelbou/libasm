SECTION	.text
global	ft_strcpy

ft_strcpy:
		push	rdi
		push	rsi
		mov		rax, 0

copychar:
		cmp		byte [rsi], 0
		jz		finished
		mov		dl, [rsi]
		mov		[rdi], dl
		inc		rdi
		inc		rsi
		jmp		copychar

finished:
		pop		rsi
		pop		rdi
		mov		rax, rdi
		ret
