						segment	.text
						global	_ft_list_push_front
						extern	_malloc
						extern	_ft_write

_ft_list_push_front:							; rdi = **list rsi = *data
						push	rsp
						push	rdi				; save
						push	rsi
						mov		rdi, 16			; sizeof(t_list) = 16
						call	_malloc
						pop		rsi
						pop		rdi
						cmp		rax, 0			; check malloc
						je		.return

						mov		[rax], rsi		; new.data = data
						mov		r9, [rdi]
						mov		[rax + 8], r9	; new.next = *list
						mov		[rdi], rax		; *list = new
.return:
						pop 	rsp
						ret