include Irvine32.inc

; Tim max, min 3 so cho truoc

.data
	msg BYTE "Nhap so thu ", 0
	msg1 BYTE "Max: ", 0
	msg2 BYTE "Min: ", 0
	num DWORD 3 DUP(?)
	i DWORD 0

.code
	main proc
	; nhap 3 so ban dau
		mov ecx, 3
		lea esi, num
	L1:
		lea edx, msg
		call writestring
		mov eax, i
		call writedec
		mov al, ':'
		call writechar
		mov al, ' '
		call writechar
		call readDec
		mov [esi], eax
		add esi, TYPE num
		inc i
		loop L1

	; tim Max, Min
		lea esi, num
		mov ebx, [esi]			; max
		mov ecx, [esi]			; min
		add esi, TYPE num		; tang len so thu 2
		mov edx, 2
	L2:	
		cmp edx, 0
		jz Print
		mov eax, [esi]
		cmp eax, ebx			; so sanh min voi so thu 2, 3
		jle NHOHON			; neu min nho hon so thu 2, 3
		mov ebx, eax			; nguoc lai, so thu 2 = max
		jmp Next

	NHOHON:
		cmp eax, ecx
		jge Next
		mov ecx, eax			; so thu 2 = min
	
	Next:
		add esi, TYPE num		; tang len so thu 3
		dec edx
		jmp L2
	
	Print:
		lea edx, msg1
		call writestring
		mov eax, ebx
		call writedec
		call crlf

		lea edx, msg2
		call writestring
		mov eax, ecx
		call writedec
	
	Thoat:
		call crlf
		exit

	main endp
end main