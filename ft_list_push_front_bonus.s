global	ft_list_push_front

extern	__errno_location

ft_list_push_front:
	push	rdi
	push	rsi
	mov		rdi, 16 ; sizeof t_list
	extern	malloc
	call	malloc
	test	rax, rax ; check error
	js		_error
	pop		rsi
	pop		rdi
	mov		[rax], rsi ; move data
	mov		[rax + 8], rdi ; next = *begin
	mov		[rdi], rax ; *begin = new
	ret

_error:
	neg	rax
	mov	r15, rax
	call	__errno_location
	mov	[rax], r15
	mov	rax, -1
	ret

