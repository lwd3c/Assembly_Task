include Irvine32.inc
; nhan ax voi 27
.data


.code
main proc
	xor eax, eax
	mov ax, 5
	mov bx, ax
	mov dx, ax
	shl dx, 4
	push edx
	mov dx, ax
	shl dx, 3
	shl ax, 1
	add ax, dx
	pop edx
	add ax, dx
	add ax, bx
	call writeDec
	exit

main endp
end main