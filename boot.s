# start my own os - stein
# by sonne
# Oct 11 2016

	.org 0x7c00
	movw %cs, %ax
	movw %ax, %ds
	movw %ax, %es
	call print_str
	s:jmp s

print_str:
	movw $str, %ax
	movw %ax, %bp
	movw $16, %cx
	movw $0x1301, %ax
	movw $0x000c, %bx
	movb $0, %dl
	int $0x10
	ret
str:	.ascii "my stein--my os."
	.space 510
	.long 0xaa55
