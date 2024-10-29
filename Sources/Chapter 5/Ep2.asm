include Irvine32.inc

.code
	main proc
		mov eax, 5
		mov ecx, 10
		mov edx, 15
		mov ebx, 20
		mov esi, 25
		mov edi, 30

		pushad

		mov ecx, 6
	L2:
		pop eax
		call writeDec
		mov al, ' '
		call writeChar
		cmp ecx, 5
		je L1
		loop L2

		exit

	 L1:
		pop eax
		dec ecx
		pop eax
		jmp L2

	main endp
end main