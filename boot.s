; begin develop boot by nasm
; by sonne
; Oct 14 2016

org 07c00h
mov ax, cs
mov ds, ax
mov es, ax
call print_stein_welcome
call load_stein

print_stein_welcome:
	mov ax, boot_str
	mov bp, ax
	mov cx, boot_strlen
	mov ax, 1301h
	mov bx, 000ch
	mov dl, 0
	int 10h
	ret
load_stein:
	mov ah, 02h
	mov al, 01h
	mov ch, 00h
	mov cl, 02h
	mov dh, 00h
	mov dl, 00h
	mov bx, os
	int 13h
	ret
boot_str:
	db "I am stein"
	db 0dh,0ah
	db "loading..."
boot_strlen equ $-boot_str
times 510-($-$$) db 0
dw 0xaa55
os:
	call after_load_stein_sayhi
	jmp $
after_load_stein_sayhi:
	mov ax, loaded_stein_hi_str
	mov bp, ax
	mov cx, loaded_stein_hi_strlen
	mov ax, 01301h
	mov bx, 000eh
	mov dx, 1000h
	int 10h
	ret
loaded_stein_hi_str:
	db "stein loaded"
	db 0dh, 0ah
	db "stein my os"
loaded_stein_hi_strlen equ $-loaded_stein_hi_str
	times 1022-($-$$) db 0

