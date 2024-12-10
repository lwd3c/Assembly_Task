include Irvine32.inc

; tinh hoan vi cua k phan tu: P(k) = k!

.data
	msg BYTE "Nhap k: ", 0
	msg2 BYTE "P(k) = ", 0
	msg3 BYTE "Gia tri cua k phai lon hon hoac bang 0 !", 0

.code
	main proc
	; nhap k
		lea edx, msg
		call writestring
		call readint
		cmp eax, 0
		jl Error

	; tinh giai thua
		call GiaiThua
		jmp Print

	; bao loi k < 0
	Error:
		lea edx, msg3
		call writestring
		jmp Thoat

	; hien thi ket qua
	Print:
		lea edx, msg2
		call writestring
		call writedec
	
	; thoat chuong trinh
	Thoat:
		call crlf
		exit
	main endp

	GiaiThua proc
		mov ecx, eax
		mov eax, 1
		mov ebx, 1
	L1:	
		cmp ecx, 0
		jz Return
		mul ebx
		inc ebx
		dec ecx
		jmp L1
	Return:
		ret
	GiaiThua endp

end main
