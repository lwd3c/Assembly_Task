include Irvine32.inc

.data
	Sarray SWORD -1,-2,-3,-4
.code
	main proc
		mov ax, [Sarray]
		mov bx, [Sarray + 2]
		mov cx, [Sarray + 4]
		mov dx, [Sarray + 6]
		call dumpregs
		exit
	main endp
end main