						segment .text
						global _ft_strdup
						extern _malloc
						extern _ft_strlen
						extern _ft_strcpy

_ft_strdup:
				call	_ft_strlen
				add		rax, 1
				push	rdi
				mov		rdi, rax
				call	_malloc
				pop		rdi
				cmp		rax, 0
				je		.error
				push	rsi
				mov 	rsi, rdi
				mov		rdi, rax
				call	_ft_strcpy
				pop 	rsi
				ret
.error:
				mov rax, -1
				ret