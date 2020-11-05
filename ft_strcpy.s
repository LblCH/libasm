				segment .text
				global _ft_strcpy

_ft_strcpy:						; rdi = dst  rsi = src
			cmp		rsi, 0		; !rsi
			je		.return
			xor		rcx, rcx	; i = 0
			jmp		.loop
.increment:
			inc		rcx			; i++
.loop:
			mov		dl , BYTE [rsi + rcx]
			mov		BYTE [rdi + rcx], dl
			cmp		dl, 0
			jne		.increment
.return:
			mov 	rax, rdi	; return dst
			ret