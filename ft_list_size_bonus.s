global	ft_list_size

ft_list_size:
		push	rdi
		mov		rax, 0

_loop:
		cmp		rdi, 0
		je		_return_size
		inc		rax
		mov		rdi, [rdi + 8]
		jmp		_loop

_return_size:
		pop		rdi
		ret
