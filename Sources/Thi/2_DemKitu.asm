include Irvine32.inc

; dem so ky tu X co trong 1 string

.data
	msg BYTE "Nhap string ban dau: ", 0
	msg2 BYTE "Nhap ki tu can dem trong String: ", 0
	msg3 BYTE "So ki tu '", 0
	msg5 BYTE "' co trong String la: ", 0
	msg4 BYTE "String da nhap: ", 0
	string BYTE 200 DUP(?)
	charX BYTE ?
	count DWORD 0
	leng DWORD ?

.code
	main proc
	; nhap string ban dau
		lea edx, msg
		call writestring
		lea edx, string
		mov ecx, 100
		call readstring
		mov leng, eax

	; nhap ki tu can dem
		lea edx, msg2
		call writestring
		call readchar
		call writechar
		mov charX, al
		call crlf

	; dem so ki tu trong string
		mov al, charX
		mov ecx, leng
		lea esi, string
	L1:	
		cmp ecx, 0
		je Print
		cmp [esi], al
		je Dem

	Next:
		inc esi
		dec ecx
		jmp L1

	Dem:
		inc count
		jmp Next
	
	; hien thi ket qua
	Print:
		lea edx, msg3
		call writestring
		mov al, charX
		call writeChar
		lea edx, msg5
		call writestring
		mov eax, count
		call writeDec

	; thoat chuong trinh
		call crlf
		exit

	main endp
end main