include Irvine32.inc

; tinh tong cua day so tu 1/1 den 1/n

.data
	msg BYTE "Nhap gia tri cua n: ", 0
	msg2 BYTE "Tong cua day so tu 1/1 den 1/n la: ", 0
	msg3 BYTE "Gia tri cua n phai lon hon 0 !", 0
	n DWORD ?
	sum DWORD ?

.code
	main proc
	; nhap gia tri n
		lea edx, msg
		call writestring
		call readDec
		mov n, eax
		cmp eax, 0
		jle Error
	
	; tinh tong
		fldz				; khoi tao tong ban dau = 0
		mov ebx, 1 
	L1:
		cmp ebx, n
		jg Print

		push ebx
		fild dword ptr [esp]	; chuyen so nguyen thanh so thuc va day vao FPU stack
		fld1						; nap 1.0 vao FPU stack
		fdiv						; thuc hien chia 1/ebx
		fadd						; cong ket qua vao tong
		pop ebx

		inc ebx
		jmp L1

	; Thong bao loi n = 0
	Error:
		lea edx, msg3
		call writestring
		jmp Thoat

	; hien thi ket qua
	Print:
		fstp sum			; luu ket qua vao sum
		lea edx, msg2
		call writestring
		fld sum			; nap sum vao FPU stack
		call writefloat
	
	; thoat chuong trinh
	Thoat:
		call crlf
		exit

	main endp
end main