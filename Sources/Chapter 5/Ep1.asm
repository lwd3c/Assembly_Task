include Irvine32.inc

.data
	msg BYTE "Chuoi ban dau: ", 0
	msg2 BYTE "Chuoi dao nguoc: ", 0
	msg3 BYTE "Chuoi so nguyen ban dau: ", 0
	msg4 BYTE "Chuoi so nguyen dao nguoc: ", 0
	msg5 BYTE "Nhap do dai mang so nguyen: ", 0
	msg6 BYTE "Nhap cac phan tu cua chuoi so nguyen: ", 0
	array BYTE 256 DUP(?)
	intArray DWORD 50 DUP(?)
	leng DWORD ?

.code
	main proc
		call string
		call crlf
		call intNumber
		exit
	main endp

	intNumber proc
	; nhap so luong so nguyen 
		lea edx, msg5
		call writestring

		call readDec
		mov leng, eax
	; nhap chuoi so nguyen ban dau
		lea edx, msg6
		call writestring
		call crlf
		
		mov ecx, leng
		lea esi, intArray
	input:
		call readDec
		mov [esi], eax
		add esi, TYPE intArray
		dec ecx
		cmp ecx, 0
		jnz input
	; in chuoi ban dau
		lea edx, msg3
		call writestring

		mov ecx, leng
		lea esi, intArray
	output1:
		mov eax, [esi]
		call writeDec
		add esi, TYPE intArray
		dec ecx
		cmp ecx, 0
		jnz output1
	; dao nguoc bang stack
	;push
		mov ecx, leng
		lea esi, intArray
	L1:
		push [esi]
		add esi, TYPE intArray
		loop L1
	; pop	
		mov ecx, leng
		lea esi, intArray
	L2:	
		pop [esi]
		add esi, TYPE intArray
		loop L2
	; in chuoi dao nguoc
		call crlf
		lea edx, msg4
		call writestring
		
		mov ecx, leng
		lea esi, intArray
	output2:
		mov eax, [esi]
		call writeDec
		add esi, TYPE intArray
		dec ecx
		cmp ecx, 0
		jnz output2
		ret
	intNumber endp

	string proc
	; nhap chuoi ban dau
		lea edx, msg
		call writestring
		lea edx, array
		mov ecx, 256
		call readstring
	; dao nguoc bang stack
	; push
		mov ecx, eax
		mov ebx, eax
		lea esi, array
	L1:
		mov al, [esi]
		push ax
		inc esi
		loop L1
	; pop	
		mov ecx, ebx
		lea esi, array
	L2:	
		pop ax
		mov [esi], al
		inc esi
		loop L2
	; in chuoi dao nguoc
		lea edx, msg2
		call writestring
		lea edx, array
		call writestring
		ret
	string endp

end main