				segment .text
				global _ft_strcmp

_ft_strcmp:								; rdi = str1  rsi = str2
				push	rcx
				push	rdi
				push	rsi
				xor		rcx, rcx				; i = 0
.check:
				cmp		BYTE [rdi + rcx], 0
				je		.result
				cmp		BYTE [rsi + rcx], 0
				je		.result
				mov		dl, BYTE [rdi + rcx]	; tmp = str1[i]
				cmp		BYTE [rsi + rcx], dl	; str2[i] == tmp
				jne		.result
				inc		rcx						; i++
				jmp		.check
.result:
				mov		al, byte [rdi + rcx]	; res = str1[i]
				mov		cl, byte [rsi + rcx]	; res -= str2[i]
				sub		rax, rcx
				pop		rsi
				pop		rdi
				pop		rcx
				ret