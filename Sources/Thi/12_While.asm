include Irvine32.inc

; the hien lai cau truc While cua ngon ngu C

.data
	count DWORD ?
	msg  DB "Nhap n: ", 0
	msg1 DB "Tong n so dau tien la: ", 0

.code
	main proc
		lea edx, msg
		call writeString
		call readDec
		mov count, eax

		mov ecx, count
		mov eax, 0
	L1:
		add eax, ecx
		loop L1
	
		lea edx, msg1
		call writeString
		call writeDec
		
		call Crlf
		exit
	
	main endp
end main