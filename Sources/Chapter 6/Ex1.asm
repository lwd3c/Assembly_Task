; Encrypting a string
include Irvine32.inc

.data
	KEY DWORD ?
	buffer BYTE 256 DUP(0)
	bufSize DWORD ?
	tb1 BYTE "Nhap KEY ma hoa: ", 0
	tb2 BYTE "Nhap chuoi dau vao: ", 0
	tb3 BYTE "Chuoi sau khi ma hoa: ", 0
	tb4 BYTE "Chuoi sau khi giai ma: ", 0

.code
	main proc
	; nhap chuoi ban dau
		call Input
	; hien thi chuoi ma hoa
		lea edx, tb3
		call writestring
		call Encrypt
		call Output
	; hien thi chuoi giai ma
		lea edx, tb4
		call writestring
		call Encrypt
		call Output

		exit
	main endp

	Input proc
	; nhap KEY
		lea edx, tb1
		call writestring
		call readDec
		mov KEY, eax
	; nhap chuoi dau vao
		lea edx, tb2
		call writestring
		lea edx, buffer
		mov ecx, 256
		call readString
		mov bufSize, eax
		ret
	Input endp

	Output proc
		lea edx, buffer
		call writeString
		call crlf
		ret
	Output endp

	Encrypt proc
		mov eax, KEY
		mov ecx, bufSize
		lea esi, buffer
	L1:
		xor [esi], eax
		add esi, TYPE buffer
		dec ecx
		jnz L1
		ret
	Encrypt endp
end main