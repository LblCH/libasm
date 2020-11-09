				segment .text
				global _ft_strcmp

_ft_strcmp:								; rdi = str1  rsi = str2
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
				mov		dl, BYTE [rdi + rcx]	; res = str1[i]
				sub		dl, BYTE [rsi + rcx]	; res -= str2[i]
				cmp		dl, 0
				jg		.first
				jl		.second

.equal:
				mov		rax, 0
				ret

.first:
				mov		rax, 1
				ret

.second:
				mov		rax, -1
				ret