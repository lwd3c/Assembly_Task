include Irvine32.inc

; Tim max, min n so cho truoc

.data
	msg BYTE "Nhap n: ", 0
	msg1 BYTE "Nhap so thu ", 0
	msg2 BYTE "Max: ", 0
	msg3 BYTE "Min: ", 0
	num DWORD 256 DUP(?)
	i DWORD 1
	n DWORD ?

.code
	main proc
	; nhap n
		lea edx, msg
		call writestring
		call readdec
		mov n, eax

	; nhap n so ban dau
		mov ecx, n
		lea esi, num
	L1:
		lea edx, msg1
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
		mov edx, n
		dec edx
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
		lea edx, msg2
		call writestring
		mov eax, ebx
		call writedec
		call crlf

		lea edx, msg3
		call writestring
		mov eax, ecx
		call writedec
	
	Thoat:
		call crlf
		exit

	main endp
end main