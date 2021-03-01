global	ft_strdup
extern __errno_location
extern ft_strlen
extern ft_strcpy

ft_strdup:
	mov	r15, rdi
	call	ft_strlen
	mov	r14, rax
	inc	rax
; recuperation len
	mov	rdi, rax
	extern	malloc
	call	malloc
	test	rax, rax
	js	_error
; allocation de la memoire 
	mov	rdi, rax
	mov	rsi, r15
	call	ft_strcpy
	mov		byte [rax + r14], 0 
	ret;

_error:
	neg	rax
	mov	r15, rax
	call	__errno_location
	mov	[rax], r15
	mov	rax, -1
	ret
