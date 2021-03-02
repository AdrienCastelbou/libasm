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
		mov		rax, 10
		call	_check_base
		ret


_check_base:
		mov		r12, 0 ; init i = 0

_i_loop:
		mov		r14b, byte [rsi + r12] ; take base[i] value
		mov		r13, r12 ; init j = i
		inc		r13 ; j = i + 1
		cmp		r14b, 0 ; check if base[i] = 0
		je		_finished ; if it is, cut the loop
		cmp		r14b, 9
		je		_check_end
		cmp		r14b, 10
		je		_check_end
		cmp		r14b, 11
		je		_check_end
		cmp		r14b, 12
		je		_check_end
		cmp		r14b, 13
		je		_check_end
		cmp		r14b, 32
		je		_check_end
		cmp		r14b, 43
		je		_check_end
		cmp		r14b, 45
		je		_check_end


_j_loop:
		mov		r15b, byte [rsi + r13] ; take base[j] value
		cmp		r15b, 0 ; check if base[j] = 0
		je		_it_loop_i ; if it is, restart a loop with i++
		cmp		r15b, r14b ; check if base[i] == base[j]
		je		_check_end ; if it is, cut and say invalid base
		inc		r13 ; inc j
		jmp		_j_loop ; do an other turn

_it_loop_i:
		inc		r12
		jmp		_i_loop

_finished:
		mov		rax, 1
		ret

_check_end:
		mov		rax, 0
		ret
