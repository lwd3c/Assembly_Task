include Irvine32.inc

; dung XOR trien khai ma hoa va giai ma 1 String

.data
	msg BYTE "Nhap String ban dau: ", 0
	msg2 BYTE "Nhap Key XOR: ", 0
	msg3 BYTE "String encrypt: ", 0
	msg4 BYTE "String decrypt: ", 0
	string BYTE 200 DUP(?)
	leng DWORD ?
	key DWORD ?
.code
	main proc
	; nhap string ban dau
		lea edx, msg
		call writestring
		lea edx, string
		mov ecx, 200
		call readstring
		mov leng, eax
	
	; nhap key XOR
		lea edx, msg2
		call writestring
		call readDec
		mov key, eax

	; Encrypt
		lea edx, msg3
		call writestring
		lea edi, string
		call Encrypt
	
	; Decrypt
		lea edx, msg4
		call writestring
		lea edi, string
		call Encrypt

		call crlf
		exit
	main endp
	
	; ham ma hoa
	Encrypt proc
		mov ecx, leng
		mov eax, key
	L1:	
		xor [edi], eax
		inc edi
		loop L1

	; in chuoi ma hoa
		lea edx, string
		call writestring
		call crlf
		ret
	Encrypt endp

end main