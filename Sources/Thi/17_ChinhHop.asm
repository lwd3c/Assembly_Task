include Irvine32.inc

; tinh chinh hop chap k cua n phan tu: A(n, k) = n! / (n - k)!

.data
	msg BYTE "Nhap n: ", 0
	msg2 BYTE "Nhap k: ", 0
	msg3 BYTE "A(n, k) = ", 0
	msg4 BYTE "Gia tri cua k phai nho hon hoac bang n !", 0
	msg5 BYTE "Gia tri cua n phai lon hon hoac bang 0 !", 0
	msg6 BYTE "Gia tri cua k phai lon hon hoac bang 0 !", 0
	n DWORD ?
	k DWORD ?
	i DWORD ?

.code
	main proc
	; nhap n, k
		lea edx, msg
		call writestring
		call readint
		cmp eax, 0
		jl Error1
		mov n, eax
		mov i, eax

		lea edx, msg2
		call writestring
		call readint
		cmp eax, 0
		jl Error2
		mov k, eax
		cmp eax, n
		jg Error
		sub i, eax		; i = n - k

	; tinh giai thua
		mov eax, n		; n!
		call GiaiThua
		mov n, eax
		mov eax, i		; i! = (n - k)!
		call GiaiThua
		mov i, eax
	
	; tinh chinh hop
		mov edi, n
		mov esi, i
		call ChinhHop		; n! / i!
		jmp Print

	; bao loi n < 0
	Error1:
		lea edx, msg5
		call writestring
		jmp Thoat
	
	; bao loi k < 0
	Error2:
		lea edx, msg6
		call writestring
		jmp Thoat

	; bao loi k > n
	Error:
		lea edx, msg4
		call writestring
		jmp Thoat

	; hien thi ket qua
	Print:
		lea edx, msg3
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

	ChinhHop proc
		mov eax, edi		; n!	
		mov ebx, esi		; i!
		cdq
		div ebx			; eax = n! / (n - k)!
		ret
	ChinhHop endp
end main
