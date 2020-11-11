						segment .text
						global	_ft_list_remove_if

_ft_list_remove_if:		; rdi = **list rsi = *data_ref rdx = *cmp rcx = *free_fnc
						cmp		rdi, 0				; !**list
						je		.return
						cmp		qword [rdi], 0		; !*list
						je		.return
						mov		r8, rdi				; r8 = **begin
						mov		r9, [rdi]			; r9 = *list
						xor		rbx, rbx			; rbx = *previous

.loop:
						cmp		r9, 0				; !*list
						je		.return
						mov		rdi, [r9]			; rdi = list->data
						push	rdx
						push	rcx
						push	rsi
						call	rdx					; *cmp(list->data, data_ref)
						pop		rsi
						pop		rcx
						pop		rdx
						cmp		rax, 0
						je		.delete_elem
						mov		rbx, r9				; rbx = *list
						mov		r9, [r9 + 8]		; r9 = *next
						jmp		.loop

.delete_elem:
						cmp		rbx, 0				; *begin == *list
						je		.first_elem
						mov		rax, [r9 + 8]		; r9 = list->next
						mov		[rbx + 8], rax		; prev->next = list->next

.free:
						mov		rdi, r9				;
						mov		r9, [r9 + 8]
						push	rdx
						push	rcx
						push	rsi
						push	r8
						push	r9
						call	rcx					; free_fct(list->data)
						pop		r9
						pop		r8
						pop		rsi
						pop		rcx
						pop		rdx
						jmp		.loop

.first_elem:
						mov		rax, [r9 + 8]
						mov		[r8], rax			; *begin = list->next
						jmp		.free

.return:
						ret