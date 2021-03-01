global ft_atoi_base
extern ft_strlen

ft_atoi_base:
		mov		r15, rdi
		mov		rdi, rsi
		call	ft_strlen
		mov		rsi, rdi
		mov		rdi, r15
		cmp		rax, 2
		jb		_check_end
		mov		r14, rsi
		jmp		_check_dup
		ret

_check_dup:
		mov		r15, r14
		inc		r15
		cmp		byte [r14], 0
		jz		_check_end
		jmp		_cmp_c
		inc		r14
		jmp		_check_dup

_cmp_c:
		cmp		byte [r15], 0
		jz		ret
		cmp		byte [r15], byte [r14]
		jz		_check_end
		inc		r15
		jmp		_cmp_c

_check_end:
		mov		rax, -1
		ret
