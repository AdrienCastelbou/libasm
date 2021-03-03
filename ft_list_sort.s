global	ft_list_sort

ft_list_sort:
		mov		r15, rsi
		mov		r12, [rdi] ; r12 = *begin
		push	rdi
		push	rsi

_loop:
		cmp		r12, 0 ; i = 0?
		je		_exit
mov		r13, [r12 + 8] ; r13 = r12->next
		mov		rdi, [r12] ; arg 1

_cmp_loop:
		cmp		r13, 0 ; j = 0?
		je		_it_loop
		mov		rsi, [r13] ; arg 2
		call	r15 ; call fct

_it_cmp_loop:
		mov		r13, [r13 + 8] ; it
		cmp		r13, 0
		;jmp		_exit
		jmp		_cmp_loop



_it_loop:
		mov		r12, [r12 + 8]
		jmp		_loop

_exit:
		pop		rsi
		pop		rdi
		ret
