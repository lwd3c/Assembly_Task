include Irvine32.inc

; tinh to hop chap k cua n phan tu: C(n, k) = n! / ( k! * (n - k)! )

.data
	msg BYTE "Nhap n: ", 0
	msg2 BYTE "Nhap k: ", 0
	msg3 BYTE "C(n, k) = ", 0
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
		mov eax, k		; k!
		call GiaiThua
		mov k, eax
		mov eax, i		; i! = (n - k)!
		call GiaiThua
		mov i, eax
	
	; tinh to hop
		mov edi, n
		mov esi, k
		mov edx, i
		call ToHop
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

	ToHop proc
		mov eax, esi		
		mov ebx, edx
		mul ebx			
		mov ebx, eax		; ebx = k! * (n - k)!
		mov eax, edi		; eax = n !
		cdq
		div ebx			; eax = n! / ( k! * (n - k)! )
		ret
	ToHop endp
end main
