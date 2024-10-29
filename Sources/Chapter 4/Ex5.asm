include Irvine32.inc

.data
	source BYTE "This is the source string", 0
	target BYTE SIZEOF source DUP ('#')
	msg1 DB "Chuoi ban dau: ", 0
	msg2 DB "Chuoi sau khi dao nguoc: ", 0

.code
	main proc
	; in chuoi ban dau
		lea edx, msg1
		call writestring
		lea edx, source
		call writestring
		call crlf

	; dao nguoc chuoi
		mov ecx, LENGTHOF source			; ecx = kich thuoc mang
		dec ecx						; phan tu cuoi cung
		mov edi, 0					; chi so phan tu dau tien mang
	L1:
		mov al, BYTE PTR source[edi]
		mov target[ecx-1], al
		inc edi
		loop L1

	; in chuoi sau
		lea edx, msg2
		call writestring
		mov ecx, LENGTHOF target
		mov target[ecx-1], 0
		lea edx, target
		call writestring
		exit

	main endp
end main