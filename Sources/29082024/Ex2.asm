include Irvine32.inc

.data
	msg1 DB "Chuoi ban dau: ", 0
	string1 BYTE "This is a string", 0
	msg2 DB "Chuoi truoc khi sao chep: ", 0
	msg3 DB "Chuoi sau khi sao chep: ", 0
	string2 BYTE SIZEOF string1 DUP('0')

.code
	main proc
		lea edx, msg1
		call writestring
		lea edx, string1
		call writestring
		call crlf
		lea edx, msg2
		call writestring
		lea edx, string2
		call writestring

		mov esi, 0
	copy:
		mov al, string1[esi]
		mov string2[esi], al
		add esi, TYPE string1
		cmp esi, LENGTHOF string1
		jnz copy

		call crlf
		lea edx, msg3
		call writestring
		lea edx, string2
		call writestring
		exit

	main endp
end main