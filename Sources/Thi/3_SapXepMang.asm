include Irvine32.inc

; sap xep mang tang dan/ giam dan
.data
	tb BYTE "Nhap do dai mang ban dau: " , 0
	tb2 BYTE "Nhap phan tu thu ", 0
	tb3 BYTE "Mang ban dau la: ", 0
	msg BYTE "Mang sau khi sap xep tang dan: ", 0
	msg2 BYTE "Mang sau khi sap xep giam dan: ", 0
	array SDWORD 256 DUP(?)
	leng DWORD ?

.code
	main proc
		call Input
		lea esi, array
		mov ecx, leng
		call TangDan
		call GiamDan
		exit
	main endp

; nhap vao mang ban dau
	Input proc
	; nhap do dai mang
		lea edx, tb
		call writestring
		call readDec
		mov leng, eax
	; nhap tung phan tu cua mang
		mov ecx, leng
		lea esi, array
		mov edi, 1
	input_loop:
		lea edx, tb2
		call writestring
		mov eax, edi
		call writeDec
		mov ax, ':'
		call writeChar
		mov ax, ' '
		call writeChar
		call readInt
		mov [esi], eax			; luu vao mang
		add esi, TYPE array
		dec ecx
		inc edi
		cmp ecx, 0
		jnz input_loop
	; in mang ban dau
		call crlf
		lea edx, tb3
		call writestring
		call PrintArray
		ret
	Input endp

; sap xep mang tang dan
	TangDan proc
	; bubble sort
			push ecx
			push esi

			dec ecx			; so vong lap ngoai
	
		out_loop:
			mov eax, 0		; i = 0
			mov edi, ecx		; so vong lap trong

			in_loop:
				mov edx, [esi + eax * 4]		; phan tu dau tien
				mov ebx, [esi + eax * 4 + 4]	; phan tu tiep theo
				cmp edx, ebx
				jle next

			; hoan doi
				mov [esi + eax * 4], ebx
				mov [esi + eax * 4 + 4], edx

			next:
				inc eax		; j++
				dec edi		; giam so lan lap trong
				jnz in_loop

			dec ecx		; giam vong lap ngoai
			jnz out_loop
	
		Ketqua:
			lea edx, msg
			call writestring
			call PrintArray

			pop esi
			pop ecx
			ret
	TangDan endp

; sap xep mang giam dan
	GiamDan proc
	; bubble sort
			push ecx
			push esi

			dec ecx			; so vong lap ngoai
	
		out_loop:
			mov eax, 0		; i = 0
			mov edi, ecx		; so vong lap trong

			in_loop:
				mov edx, [esi + eax * 4]		; phan tu dau tien
				mov ebx, [esi + eax * 4 + 4]	; phan tu tiep theo
				cmp edx, ebx
				jg next

			; hoan doi
				mov [esi + eax * 4], ebx
				mov [esi + eax * 4 + 4], edx

			next:
				inc eax		; i++
				dec edi		; giam so lan lap trong
				jnz in_loop

			dec ecx		; giam vong lap ngoai
			jnz out_loop
	
		Ketqua:
			lea edx, msg2
			call writestring
			call PrintArray

			pop esi
			pop ecx
			ret
	GiamDan endp

; hien thi mang ra man hinh
	PrintArray proc
			mov ecx, leng
			lea esi, array
		print_loop:
			mov eax, [esi]
			call writeInt
			mov al, ' '
			call writeChar
			add esi, TYPE array
			dec ecx
			jnz print_loop
			call crlf
			ret
	PrintArray endp

end main