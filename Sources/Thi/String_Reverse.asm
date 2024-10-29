include Irvine32.inc

; dao nguoc 1 string cho truoc

.data
	msg BYTE "Nhap String ban dau: ", 0
	msg2 BYTE "String dao nguoc: ", 0
	string BYTE 200 DUP(?)
	string2 BYTE SIZEOF string DUP(?) 
	leng DWORD ?

.code
	main proc
	; nhap string ban dau
		lea edx, msg
		call writestring
		lea edx, string
		mov ecx, 200
		call readstring
		mov leng, eax
	
	; dao nguoc string
		lea edi, string
		lea esi, string2
		call Reverse

	; in string dao nguoc
		lea edx, msg2
		call writestring
		lea edx, string2
		call writestring

		call crlf
		exit

	main endp

	Reverse proc
		add edi, leng 
		dec edi
		mov ecx , leng
	L1:
		cmp ecx, 0
		jz Thoat
		mov al, [edi]
		mov [esi], al
		inc esi
		dec edi
		dec ecx
		jmp L1

	Thoat:
		ret
	Reverse endp

end main