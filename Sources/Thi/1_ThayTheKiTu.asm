include Irvine32.inc

; thay the ki tu X bang ki tu Y trong 1 String

.data
	msg BYTE "Nhap vao String ban dau: ", 0
	msg1 BYTE "Nhap ki tu can thay the: ", 0
	msg2 BYTE "Nhap ki tu thay the: ", 0
	msg3 BYTE "String sau khi thay the: ", 0
	string BYTE 200 DUP(0)
	charX BYTE ?
	charY BYTE ?
	leng DWORD ?

.code
	main proc
	; nhap chuoi ban dau
		lea edx, msg
		call writestring		
		lea edx, string
		mov ecx, 200
		call readstring
		mov leng, eax		

	; nhap ki tu can thay the 
		lea edx, msg1
		call writestring
		call ReadChar
		call writechar
		mov charX, al			
		call crlf

	; nhap ki tu thay the 
		lea edx, msg2
		call writestring
		call readchar
		call writechar
		mov charY, al
		call crlf

	; thay the ki tu trong String
		mov ah, charX			; X
		mov al, charY			; Y
		mov ecx, leng
		lea esi, string
	L1:
		cmp ecx, 0
		jz Print
		cmp [esi], ah
		je ThayThe

	Next:
		inc esi
		dec ecx
		jmp L1

	ThayThe:
		mov [esi], al
		jmp Next
	
	; hien thi String sau khi thay the
	Print:
		lea edx, msg3
		call writestring
		lea edx, string
		call writeString

	; thoat chuong trinh
		call crlf
		exit

	main endp

end main