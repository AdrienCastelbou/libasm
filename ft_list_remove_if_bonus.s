global	ft_list_remove_if

extern	free
ft_list_remove_if:
		push	rdi ; begin
		push	rsi ; data_ref
		push	rdx ; ft_cmp
		push	rcx ; ft_free
		mov		r10, [rdi] ; r12 = *begin
		mov		r9, 0 ; previous->next = *begin
		mov		r11, rdx ; ft_cmp
		mov		r12, rsi ; data_ref
		mov		rax, 0

_rmv_loop:
		cmp		r10, 0
		je		_exit
		mov		rdi, [r10] ; arg 1 = elem->data
		mov		rsi, rsi ; arg 2 = data_ref
		call	r11 ; call ft_cmp
		cmp		rax, 0
		je		_free_and_link ; go free elem

_inc_loop:
		mov		r9, r10 ; previous = elem
		mov		r10, [r10 + 8] ; elem = elem->next
		jmp		_rmv_loop ; loop

_free_and_link:
		cmp		r9, 0 ; check if it is the list begin
		je		_set_previous
		mov		r15, [r10 + 8]
		mov		[r9 + 8], r15 ; previous->next = elem->next
		jmp		_free_elem

_free_elem:
		mov		rdi, [r10] ; free data
		call	free
		mov		rdi, r10 ; free elem
		call	free
		cmp		r9, 0
		je		_set_begin_to_elem
		mov		r10, r15
		jmp		_rmv_loop


_set_begin_to_elem:
		pop		rcx
		pop		rdx
		pop		rsi
		pop		rdi
		mov		r15, [rdi] ; change *begin
		mov		r10, r15 ; *begin = elem->next
		push	rdi ; begin
		push	rsi ; data_ref
		push	rdx ; ft_cmp
		push	rcx ; ft_free
		jmp		_rmv_loop
 
_set_previous:
		pop		rcx
		pop		rdx
		pop		rsi
		pop		rdi
		mov		r15, [r10 + 8] ; change *begin
		mov		[rdi], r15 ; *begin = elem->next
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

