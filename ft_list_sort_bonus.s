global	ft_list_sort

extern	ft_write

ft_list_sort:
		mov		r15, rsi
		mov		r12, [rdi] ; r12 = *begin
		push	rdi
		push	rsi

_sort_loop:

		cmp		r12, 0 ; i = 0?
		je		_exit
		mov		r13, [r12 + 8] ; r13 = elem->next
		cmp		r13, 0
		je		_exit

_cmp_loop:

		cmp		r12, 0 ; i = 0?
		je		_exit
		cmp		r13, 0 ; j = 0?
		je		_it_loop
		mov		rdi, [r12] ; arg 1 = elem
		mov		rsi, [r13] ; arg 2 = elem->next
		mov		r9, r12 ; save elem
		mov		r10, r13 ; save elem->next
		call	r15 ; call ft_cmp
		cmp		rax, 0
		jg		_swap

_it_cmp_loop:

		mov		r12, r9 ; replace elem in r12
		mov		r13, r10 ; replace elem->next in r13
		mov		r13, [r13 + 8] ; it
		jmp		_cmp_loop

_swap:
		mov		r14, [r9] ; move elem->data in r14
		mov		r11, [r10] ; move elem->next->data in r11
		mov		[r10], r14 ; move elem->data in elem->next->data
		mov		[r9], r11 ; move elem->next->data in elem->data
		jmp		_it_cmp_loop

_it_loop:
		mov		r12, r9
		mov		r13, r14
		mov		r12, [r12 + 8]
		jmp		_sort_loop

_exit:
		pop		rsi
		pop		rdi
		ret
