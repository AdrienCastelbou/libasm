global	ft_list_push_front

extern		__errno_location
extern		malloc

ft_list_push_front:
	push	rdi
	push	rsi
	mov		rdi, 16 ; sizeof t_list
	xor		rax, rax
	call	malloc
	test	rax, rax ; check error
	js		_error
	pop		rsi
	pop		rdi
	mov		[rax], rsi ; move data
	mov		r11, [rdi]
	mov		[rax + 8], r11; next = *begin
	mov		[rdi], rax ; *begin = new
	ret

_error:
	neg		rax
	mov		r15, rax
	call	__errno_location
	mov		[rax], r15
	mov		rax, -1
	ret

