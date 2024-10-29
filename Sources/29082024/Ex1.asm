include Irvine32.inc

.data
	msg DB "Tong day so tu nhien tu 1 toi n la: ", 0
	msg2 DB "Nhap vao n: ", 0 
	val1 DWORD ?
.code
	main proc
		lea edx, msg2
		call writestring
		call readDec
		mov ecx, eax
		xor eax, eax
	L1:
		add eax, ecx
		loop L1

		lea edx, msg
		call writestring
		call writedec
		exit
	main endp
end main