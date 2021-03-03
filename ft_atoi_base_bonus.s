global ft_atoi_base
extern ft_strlen

ft_atoi_base:
		mov		r15, rdi
		mov		rdi, rsi
		call	ft_strlen
		mov		rsi, rdi
		mov		rdi, r15
		cmp		rax, 2 ; check size of base 
		jb		_check_end
		mov		rdx, rax ; save size of the base in rdx
		call	_check_base
		cmp		rax, 0
		je		_check_end
		call	_ft_atoi
		cmp		r11, 1
		je		_ret_neg_int
		ret

_ft_atoi:
		mov		r11, 0 ; sign marker
		mov		r12, 0 ; loop it
		mov		r13, 0 ; the integer which is returned
		mov		rax, 0

_skip_spaces: ; check if str[i] is space
		mov		r14b, [rdi + r12] 
		cmp		r14b, 9
		je		_it_skip_spaces_loop
		cmp		r14b, 10
		je		_it_skip_spaces_loop
		cmp		r14b, 11
		je		_it_skip_spaces_loop
		cmp		r14b, 12
		je		_it_skip_spaces_loop
		cmp		r14b, 13
		je		_it_skip_spaces_loop
		cmp		r14b, 32
		je		_it_skip_spaces_loop

_take_sign:
		mov		r14b, [rdi + r12]
		cmp		r14b, 43 ; check if str[i] is +
		je		_it_sign ; if it is, just it++
		cmp		r14b, 45 ; check if str[j] is +
		je		_get_sign ; if it is, adjust sign value and it++

_convert_base:
		mov		r14b, [rdi + r12] ; get str[i] 
		call	_ft_strchr ; check if str[i] is in base 
		cmp		rax, -1 ; check if it is not or the end
		je		_return_atoi 
		imul	r13, rdx ; mul result by size
		add		r13, rax ; add char value inside base
		inc		r12
		jmp		_convert_base

_return_atoi:
		mov		rax, r13
		ret

_ret_neg_int:
		imul	rax, -1
		ret

_ft_strchr:
		mov		r15, 0
		mov		rax, 0

_cmp_char:
		cmp		r14b, 0 ; check if it is the end of our str
		je		_not_in_base 
		cmp		byte [rsi + r15], 0 ; check if it is the end of base set
		je		_not_in_base
		cmp		r14b, byte [rsi + r15] ; check if c is in the base
		je		_return_pos
		inc		r15
		jmp		_cmp_char

_not_in_base:
		mov		rax, -1
		ret

_return_pos:
		mov		rax, r15
		ret

_get_sign:
		cmp		r11, 0
		je		_add_neg_sign
		mov		r11, 0
		jmp		_it_sign

_add_neg_sign:
		mov		r11, 1
		jmp		_it_sign

_it_sign:
		inc		r12
		jmp		_take_sign

_it_skip_spaces_loop:
		inc		r12
		jmp		_skip_spaces

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
