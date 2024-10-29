include Irvine32.inc

.data
	TB DB "Nhap vao chuoi: ", 0
	TB2 DB "Chuoi sau khi dao nguoc la: ", 0
	string DWORD ?
	reverse_str DWORD ?
.code
	main proc
		lea edx, TB
		call writeString
		lea edx, string
		mov ecx, 50
		call readString
		 
		cmp BYTE PTR [esi+ecx-1], 13
		jne Skip
		dec ecx
	Skip:
		lea esi, string
		lea edi, reverse_str
		mov ecx, eax	 
	L1:
		xor al, al	
		mov al, [esi+ecx-1]
		mov [edi], al
		dec ecx
		inc edi
		cmp ecx, 0
		jg L1

		lea edx, TB2
		call writestring
		lea edx, reverse_str
		call writestring
		
		call crlf
		call waitmsg
	main endp
end main