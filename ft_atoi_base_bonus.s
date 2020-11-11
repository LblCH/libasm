						segment .text
						global	_ft_atoi_base

_ft_atoi_base:											; rdi = *str rsi = *base
						mov		r8, 1					; sign = 1
						xor		rax, rax				; res = 0
						cmp		rsi, 0					; !base
						je		.return
						xor		rcx,rcx					; i = 0
						xor		rbx,rbx					; j = 0
						xor		r9, r9					; base_len = 0

.check_base:
						cmp		BYTE [rsi + rcx], 0		; b[i] == \0
						je		.count_zero
						cmp		BYTE [rsi + rcx], 32	; b[i] == ' '
						je	 	.return
						cmp		BYTE [rsi + rcx], 9		; b[i] == \t
						je		.return
						cmp		BYTE [rsi + rcx], 10	; b[i] == \n
						je		.return
						cmp		BYTE [rsi + rcx], 11	; b[i] == \v
						je		.return
						cmp		BYTE [rsi + rcx], 12	; b[i] == \f
						je		.return
						cmp		BYTE [rsi + rcx], 13	; b[i] == \r
						je		.return
						cmp		BYTE [rsi + rcx], 45	; b[i] == '-'
						je	 	.return
						cmp		BYTE [rsi + rcx], 43	; b[i] == '+'
						je		.return
						xor		rbx,rbx					; j = 0

.check_base_repeat:
						cmp		rbx, r9					; j == base_len
						je		.check_base_increment
						mov		dl, [rsi + rbx]
						cmp		[rsi + rcx], dl			; b[i] == b[j]
						je		.return
						inc		rbx						; j++
						jmp		.check_base_repeat

.check_base_increment:
						inc		rcx						; i++
						inc		r9						; base_len++
						jmp		.check_base

.count_zero:
						xor		rcx, rcx				; i = 0

.isspace:
						cmp		BYTE [rdi + rcx], 0		; s[i] == \0
						je		.return
						cmp		r9, 1					; base_len <= 1
						jle		.return
						cmp		BYTE [rdi + rcx], 32	; s[i] == ' '
						je	 	.space
						cmp		BYTE [rdi + rcx], 9		; s[i] == \t
						je		.space
						cmp		BYTE [rdi + rcx], 10	; s[i] == \n
                        je		.space
                        cmp		BYTE [rdi + rcx], 11	; s[i] == \v
                        je		.space
						cmp		BYTE [rdi + rcx], 12	; s[i] == \f
						je		.space
						cmp		BYTE [rdi + rcx], 13	; s[i] == \r
                        je		.space
                        jmp		.issign
.space:
						inc		rcx						; i++
						jmp		.isspace

.issign:
						cmp		BYTE [rdi + rcx], 0		; s[i] == \0
						je		.return
						cmp		BYTE [rdi + rcx], 45	; s[i] == '-'
                        je	 	.negative
                        cmp		BYTE [rdi + rcx], 43	; s[i] == '+'
                        je		.positive
                        jmp		.zero_base

.negative:				mov		r8, -1					; sign = -1
.positive:				inc		rcx						; i++

.zero_base:
						xor 	rbx, rbx				; j == 0

.is_in_base:
						cmp		BYTE [rdi + rcx], 0		; s[i] == \0
						je		.return
						mov		dl, BYTE [rsi + rbx]
						cmp 	BYTE [rdi + rcx], dl	; s[i] == b[j]
						je		.add
						inc		rbx						; j++
						cmp		BYTE [rsi + rbx], 0		; s[j] == \0
						je		.return
						jmp		.is_in_base

.add:
						mul		r9
						add		rax, rbx				; res += j
						inc		rcx						; i++
						jmp		.zero_base

.return:
						cmp		r8, 1					; sign == 1
						je		.end
						neg		rax						; res = - res

.end:
						ret