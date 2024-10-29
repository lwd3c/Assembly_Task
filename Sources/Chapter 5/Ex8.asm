include Irvine32.inc

.data
	msg BYTE "Nhap vao xau ki tu ban dau: ", 0
	msg2 BYTE "Xau ki tu sau khi dao nguoc: ", 0
	array BYTE 256 DUP(?)

.code
	main proc
	; nhap chuoi ban dau
		lea edx, msg
		call writestring
		lea edx, array
		mov ecx, 256
		call readString
	; dao nguoc xau
		mov ecx, eax			; do dai xau vua nhap
		dec ecx				; tru ki tu NULL 
		lea esi, array
		lea edi, array[ecx]

	reverse: 
		cmp esi, edi
		ja print
		mov al, [esi]
		xchg [edi], al
		mov [esi], al
		add esi, TYPE array
		sub edi, TYPE array
		jmp reverse

	; in chuoi dao nguoc
	print:
		lea edx, msg2
		call writestring
		lea edx, array
		call writestring
		exit
	main endp
end main