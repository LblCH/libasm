				segment .text
				global _ft_strcmp

_ft_strcmp:							; rdi = str1  rsi = str2
				xor		rax,rax
				mov		rcx, 100
				rep		cmpsb
				je		.equal
				;mov		al, BYTE [rdi]
				;sub		al, BYTE [rsi]
				;mov		BYTE [rax], al
				ret
.equal:
				mov		rax, 0
				ret