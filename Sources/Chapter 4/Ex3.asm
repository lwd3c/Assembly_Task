include Irvine32.inc

.data
	array DWORD 2,9,0,6,2,0,0,4
	msg1 DB "Mang truoc khi dao nguoc: ", 0
	msg2 DB "Mang sau khi dao nguoc: ", 0
.code
	main proc
	; truoc khi dao nguoc
		lea edx, msg1
		call writestring
		lea esi, array
		mov ecx, 8
	print:
		mov eax, [esi]
		add esi, 4
		call writedec
		dec ecx
		cmp ecx, 0
		jnz print
		call crlf

	; dao nguoc
		lea esi, array
		mov ecx, 3		; 4 cap so
		dec ecx
		lea edi, [array + 28]

	reverse:
		mov eax, [esi]
		mov ebx, [edi]
		mov [esi], ebx
		mov [edi], eax
		add esi, 4
		sub edi, 4
		cmp esi, edi
		jng reverse

	; sau khi dao nguoc
		lea edx, msg2
		call writestring
		lea esi, array
		mov ecx, 8
	print_after:
		mov eax, [esi]
		add esi, 4
		call writedec
		dec ecx
		cmp ecx, 0
		jnz print_after
		
		exit
	main endp
end main