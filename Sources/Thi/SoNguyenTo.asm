include Irvine32.inc

; kiem tra so nguyen to

.data
	msg BYTE "Nhap vao so bat ki: ", 0
	msg2 BYTE "So vua nhap la so nguyen to ! ", 0
	msg3 BYTE "So vua nhap khong la so nguyen to ! ", 0
	val1 DWORD ?

.code
	main proc
	; nhap input
		lea edx, msg
		call writestring
		call readdec
		mov val1, eax		

	; kiem tra so nguyen to
		call SoNguyenTo
		call crlf	

		exit
	main endp

; ham kiem tra so nguyen to
	SoNguyenTo proc
	; kiem tra dieu kien lon hon 1
		mov eax, val1
		cmp eax, 1
		jle KhongLaSoNguyenTo		; neu nho hon hoac bang 1 -> khong la so nguyen to
		cmp eax, 2				; 2 la so nguyen to
		je LaSoNguyenTo

	; kiem tra voi i = 2,3,4,..., (val1 / 2)
		mov eax, val1
		mov ebx, 2
		cdq
		div ebx			; tinh val1 / 2
		mov ecx, eax		; luu ket qua phan nguyen vao ecx
		mov edi, 2		; i = 2
	L1:
		mov eax, val1
		mov ebx, edi
		cdq
		div ebx				
		cmp edx, 0			
		jz KhongLaSoNguyenTo	; kiem tra phan du, neu = 0 -> khong la so nguyen to
		inc edi				; i++
		loop L1

	LaSoNguyenTo:
		lea edx, msg2			
		call writestring
		jmp Return

	KhongLaSoNguyenTo:			
		lea edx, msg3
		call writestring

	Return:
		ret
	SoNguyenTo endp

end main