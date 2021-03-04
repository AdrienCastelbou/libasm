global	ft_list_remove_if

extern	free
ft_list_remove_if:
		mov		r10, [rdi] ; r12 = *begin
		mov		r9, 0 ; previous->next = *begin
		mov		r11, rdx ; ft_cmp
		mov		r12, rsi ; data_ref
		push	rdi ; begin
		push	rsi ; data_ref
		push	rdx ; ft_cmp
		push	rcx ; ft_free

_loop:
		cmp		r10, 0
		je		_exit
		mov		rdi, [r10] ; arg 1 = elem->data
		mov		rsi, rsi ; arg 2 = data_ref
		call	r11 ; call ft_cmp
		cmp		rax, 0
		je		_free_and_link ; go free elem
		jmp		_inc_loop

_inc_loop:
		mov		r9, r10 ; previous = elem
		mov		r10, [r9 + 8] ; elem = elem->next
		jmp		_loop ; loop

_free_and_link:
		cmp		r9, 0 ; check if it is the list begin
		je		_change_begin

_free_elem
		mov		rdi, [r10]
		call	free
		mov		rdi, r10
		call	free
		jmp		_inc_loop

_change_begin:
		pop		rcx
		pop		rdx
		pop		rsi
		pop		rdi ; take begin
		mov		r9, [r10 + 8] ; take elem->next
		mov		[rdi], r9 ; begin = elem->next
		push	rdi ; begin
		push	rsi ; data_ref
		push	rdx ; ft_cmp
		push	rcx ; ft_free

		jmp		_free_elem

_exit:
		pop		rcx
		pop		rdx
		pop		rsi
		pop		rdi
		ret

