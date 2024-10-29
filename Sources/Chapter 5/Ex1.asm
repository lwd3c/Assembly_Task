include Irvine32.inc

.code 
	main proc
		call clrscr
		mov eax, 500
		call delay
		call dumpregs

	main endp
end main