include Irvine32.inc

; kiem tra so chinh phuong

.data
	msg BYTE "Nhap so bat ki: ", 0
	msg2 BYTE "So vua nhap la so chinh phuong !", 0
	msg3 BYTE "So vua nhap khong la so chinh phuong !", 0
	val DWORD ?

.code
	main proc
	; nhap so bat ki
		lea edx, msg
		call writestring
		call readdec
		mov val, eax
		
	; kiem tra so chinh phuong
		mov ecx, 1
	L1:
		mov eax, ecx				
		mul eax
		cmp eax, val
		je LaSoChinhPhuong
		jg KhongLaSoChinhPhuong
		inc ecx
		jmp L1
	
	KhongLaSoChinhPhuong:
		lea edx, msg3
		call writestring
		jmp Thoat

	LaSoChinhPhuong:
		lea edx, msg2
		call writestring
	
	Thoat:
		call crlf
		exit

	main endp
end main
