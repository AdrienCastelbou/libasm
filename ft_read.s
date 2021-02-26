extern __errno_location

SECTION .text
global ft_read

ft_read:
		mov		rax, 0
		syscall
		test	rax, rax
		js		error
		ret;
error:
		neg		rax
		mov		r15, rax
		call	__errno_location
		mov		[rax] , r15
		mov		rax, -1
		ret
