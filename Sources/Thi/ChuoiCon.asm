include Irvine32.inc

; tim kiem 1 chuoi con m ki tu trong xau n ki tu

.data
	tb DB "Nhap chuoi ban dau: ", 0
	msg BYTE 256 DUP(?)
	tb1 DB "Chuoi ban dau: ", 0
	tb2 DB "Nhap vao gia tri x: ", 0
	val1 DWORD ?		; x
	tb3 DB "Nhap vao gia tri y: ", 0
	val2 DWORD ?		; y
	tb4 DB "Chuoi con: ", 0
	msg2 BYTE ?		
	
.code
	main proc
	; nhap chuoi ban dau
		lea edx, tb
		call writestring
		lea edx, msg
		mov ecx, 256
		call readstring
	; in chuoi ban dau
		lea edx, tb1
		call writestring
		lea edx, msg
		call writestring
		call crlf
	; nhap x
		lea edx, tb2
		call writestring
		call readDec
		mov val1, eax
	; nhap y
		lea edx, tb3
		call writestring
		call readdec
		mov val2, eax
	; goi ham substring
		lea esi, msg
		lea edi, msg2
		call SubString
	; in ra chuoi con
		lea edx, tb4
		call writestring
		lea edx, msg2
		call writestring
		exit
	main endp

	SubString proc
		add esi, val1		; dua con tro toi vi tri bat dau
		mov ecx, val2
	L1:	
		mov al, [esi]
		mov [edi], al
		inc esi
		inc edi
		loop L1
		ret
	SubString endp

end main