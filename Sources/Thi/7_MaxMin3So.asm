include Irvine32.inc

; Tim max, min 3 so cho truoc

.data
	msg BYTE "Nhap so thu ", 0
	msg1 BYTE "Max: ", 0
	msg2 BYTE "Min: ", 0
	num SDWORD 3 DUP(?)
	i DWORD 1

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
		call readInt
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
		mov eax, [esi]			; luu phan tu thu tiep theo vao eax
		cmp eax, ebx			; so sanh voi max 
		jle NHOHON			; neu nho hon hoac bang max
		mov ebx, eax			; neu lon hon max, gan max bang gia tri do 
		jmp Next

	NHOHON:
		cmp eax, ecx			; so sanh voi min
		jge Next				; neu lon hon hoac bang min, bo qua
		mov ecx, eax			; neu nho hon min, gan min bang gia tri do
	
	Next:
		add esi, TYPE num		; tang len so tiep theo
		dec edx
		jmp L2
	
	Print:
		lea edx, msg1
		call writestring
		mov eax, ebx
		call writeInt
		call crlf

		lea edx, msg2
		call writestring
		mov eax, ecx
		call writeInt
	
	Thoat:
		call crlf
		exit

	main endp
end main