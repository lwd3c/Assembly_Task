include Irvine32.inc

.data
	tb BYTE "10 so nguyen ngau nhien trong pham vi 0 - 99 la: ", 0
	val1 DWORD ?
.code
	main proc
		lea edx, tb
		call writestring
		call crlf
		mov ecx, 10
		call Randomize
	L1:
		mov eax, 100
		call RandomRange
		mov val1, eax
		call writeint
		call crlf
		loop L1
		exit
	main endp
end main