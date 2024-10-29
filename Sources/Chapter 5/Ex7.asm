include Irvine32.inc

.data
	array DWORD 256 DUP(?)
	leng DWORD ?
	msg BYTE "Nhap so luong phan tu mang: ", 0
	msg2 BYTE "Nhap gia tri cac phan tu mang: ", 0
	msg3 BYTE "Mang vua nhap: ", 0
	msg4 BYTE "Tong cac phan tu trong mang la: ", 0

.code
	main proc
	; nhap so luong phan tu
		lea edx, msg
		call writestring
		call readDec
		mov leng, eax
	; nhap tung phan tu
		lea edx, msg2
		call writestring
		call crlf
		call Nhap
	; in ra man hinh
		lea edx, msg3
		call writestring
		call Display
	; tinh tong cac phan tu
		call crlf
		lea edx, msg4
		call writestring
		call Sum
		call writeDec

		exit
	main endp

	Nhap proc
			mov ecx, eax
			lea esi, array
		L1:
			call readDec
			mov DWORD PTR [esi], eax
			add esi, TYPE array
			loop L1
			ret
	Nhap endp

	Display proc
			mov ecx, leng
			lea esi, array
		L2:
			mov eax, [esi]
			call writeDec
			mov al, 32		; 32 - space
			call writeChar
			add esi, TYPE array
			loop L2
			ret
	Display endp

	Sum proc
			mov ecx, leng
			xor eax, eax
			lea esi, array
		L3:
			add eax, [esi]
			add esi, TYPE array
			loop L3
			ret
	Sum endp
end main