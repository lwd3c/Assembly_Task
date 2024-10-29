include Irvine32.inc

.data

.code
	main proc
		mov eax, 0	; so dau tien
		mov ebx, 1	; so thu hai
		mov ecx, 7	; so vong lap
		call dumpregs
	
	Fibonacci:
		add eax, ebx
		xchg eax, ebx
		call dumpregs
		loop Fibonacci

		exit
	main endp
end main