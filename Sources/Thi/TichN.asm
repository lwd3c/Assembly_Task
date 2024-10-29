include Irvine32.inc

; tich day tu 1 den n

.data
	msg BYTE "Nhap n: ", 0
	msg1 BYTE "Tich day tu 1 den n la: ", 0
	n DWORD ?

.code
	main proc
	; nhap n
		lea edx, msg
		call writestring
		call readdec
		mov n, eax

	; tinh tich
		mov eax, 1
		mov ebx, 1
	L1:
		cmp ebx, n
		jg Print
		mul ebx
		inc ebx
		jmp L1
	
	; in ket qua			
	Print:
		lea edx, msg1
		call writestring
		call writedec		
	
	Thoat:
		call crlf
		exit

	main endp
end main