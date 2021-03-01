extern __errno_location
%include "ft_strlen.s"
%include "ft_strcpy.s"

SECTION	.text
global	ft_strdup

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
