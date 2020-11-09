						segment .text
						global _ft_list_size

_ft_list_size:
					mov		rsi, rdi		; save begin
					xor		rax, rax		; size = 0

.count:
					cmp 	rdi, 0			; if list == 0
					je		.return			; return
					inc		rax				; else size++
					mov		rdi, [rdi + 8]  ; list = next
					jmp		.count

.return:
					mov		rdi, rsi		; list = begin
					ret
