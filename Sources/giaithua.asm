include Irvine32.inc

.data
	msg DB "Nhap vao so nguyen n bat ki: ", 0
	msg2 DB "n! =  ", 0
	val1 DWORD ?

.code
	main proc
		lea edx, msg
		call writeString
		call readDec
		mov ecx, eax
		mov eax, 1
		mov ebx, 1

	Giaithua:
		mul ebx
		inc ebx
		loop Giaithua

		mov val1, eax
		lea edx, msg2
		call writestring
		mov eax, val1
		call writedec

		call crlf
		call waitmsg
	main endp
end main