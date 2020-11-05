			segment .text
			global  _ft_strlen

_ft_strlen:
						xor	rax, rax		; i = 0
compare:
			cmp			BYTE [rdi + rax], 0
			je			exit
			inc 		rax				; i++
			jmp 		compare
exit:
			ret