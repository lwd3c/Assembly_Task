include Irvine32.inc

; tinh do dai Hamming cua 2 phan tu mang

.data
	msg1 BYTE "Nhap mang thu nhat: ", 0
	msg2 BYTE "Nhap mang thu hai:  ", 0
	msg3 BYTE "Do dai Hamming cua 2 phan tu mang la: ", 0
	msg4 BYTE "Do dai 2 mang phai bang nhau !", 0
	leng DWORD 0
	hamming DWORD 0
	array1 BYTE 256 DUP(?)
	array2 BYTE 256 DUP(?)   

.code 
	main proc
	; nhap mang thu nhat
		lea edx, msg1
		call writeString
		lea edx, array1
		mov ecx, 256
		call readString
		mov leng, eax

	; nhap mang thu hai
		lea edx, msg2
		call writeString
		lea edx, array2
		mov ecx, 256
		call readString
		cmp eax, leng			; kiem tra do dai 2 mang
		jnz Error

	; tinh do dai Hamming
		lea edi, array1
		lea esi, array2
		mov ecx, leng
		call HammingValue
		mov hamming, eax
	
	; hien thi ket qua
		lea edx, msg3
		call writeString
		mov eax, hamming
		call writeDec
		jmp Thoat

	Error:
		lea edx, msg4
		call writeString

	Thoat:	  
		exit
	main endp

	HammingValue proc
		push ecx
		push esi
		push edi
		xor eax, eax
		xor ebx, ebx
		xor edx, edx

		Compare:
			mov bl, byte ptr [edi]
			mov dl, byte ptr [esi]
			cmp bl, dl
			jnz Next 
			inc eax

		Next:
			inc edi
			inc esi
			loop Compare

		pop edi
		pop esi
		pop ecx
		ret
	HammingValue endp
end main
