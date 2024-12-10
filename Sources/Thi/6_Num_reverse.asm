include Irvine32.inc

; dao nguoc 1 so cho truoc

.data
	msg BYTE "Nhap so bat ky: ", 0
	msg2 BYTE "So dao nguoc: ", 0
	num DWORD ?
	re_num DWORD 50 DUP(?)
	i DWORD 0

.code
	main proc
	; nhap so ban dau
		lea edx, msg
		call writestring
		call readdec
		mov num, eax

	; dao nguoc so
		lea esi, re_num
		call Num_Reverse
		 
	; in so dao nguoc
		lea edx, msg2
		call writestring

		mov ecx, i
		lea esi, re_num
	Print:
		cmp ecx, 0
		jz Thoat
		mov eax, [esi]
		call writedec
		add esi, TYPE re_num
		dec ecx
		jmp Print
	
	Thoat:
		call crlf
		exit

	main endp

	Num_Reverse proc
		push esi
	L1:
		cmp eax, 0			; kiem tra phan nguyen voi 0
		jz Return
		mov ebx, 10
		cdq
		div ebx				; chia 10 de lay phan du
		mov [esi], edx			; luu vao mang dao nguoc
		add esi, TYPE re_num
		inc i
		jmp L1
	
	Return:
		pop esi
		ret
	Num_Reverse endp

end main