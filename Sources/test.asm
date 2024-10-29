include Irvine32.inc

.data
	DATE DWORD 2962004
	CCCD BYTE "034204008923", 0,0
	msg1 DB "Ngay sinh: ", 0
	msg2 DB "Ngay sinh dao nguoc: ", 0
	msg3 DB "CCCD: ", 0
	msg4 DB "Tong cac so trong CCCD la: ", 0

.code
	main proc
	; dao nguoc ngay sinh
		lea edx, msg1
		call writestring
		mov eax, DATE
		call writeDec
		call crlf
		lea edx, msg2
		call writestring

		xor ebx, ebx
		mov eax, DATE
	reverse:
		xor edx, edx
		mov ecx, 10
		div ecx
		mov ebx, eax
		mov eax, edx
		call writedec
		mov eax, ebx
		test eax, eax
		jnz reverse
		
	; tinh tong cccd
		call crlf
		lea edx, msg3
		call writestring
		lea edx, CCCD
		call writestring

		xor eax, eax
		lea esi, CCCD
	tinh_tong:
		movzx edx, BYTE PTR [esi]
		cmp edx, 0
		je print
		sub edx, '0'
		add eax, edx
		inc esi
		jnz tinh_tong

	print:
		call crlf
		lea edx, msg4
		call writestring
		call writedec

		exit
	main endp
end main