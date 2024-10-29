include Irvine32.inc

; the hien lai cau truc While cua ngon ngu C

.data
	count DWORD 100
	msg DB "Tong 100 so dau tien la: ", 0

.code
	main proc
		mov ecx, count
		mov eax, 0
	L1:
		cmp ecx, 0
		jz Print
		add eax, ecx
		dec ecx
		jmp L1
	
	Print:
		lea edx, msg
		call writeString
		call writeDec
		
		call Crlf
		exit
	
	main endp
end main