include Irvine32.inc

; xac dinh so word co trong 1 doan van

.data
	msg BYTE "Nhap doan van ban can xac dinh (toi da 254 ki tu): ", 0
	msg2 BYTE "Co tat ca ", 0
	msg3 BYTE " word trong van ban !", 0
	msg4 BYTE "Kich thuoc van ban vuot qua do dai cho phep ! Vui long nhap lai.", 0 
	paragh BYTE 256 DUP(?)
	leng DWORD ?
	count DWORD 1

.code
	main proc
	; nhap van ban can xac dinh
		lea edx, msg
		call writestring
		lea edx, paragh
		mov ecx, 256
		call readString
		mov leng, eax
		cmp eax, 254
		jg Error

	; dem word
		lea esi, paragh
		mov ecx, leng
		call WordCount
		
	; hien thi ket qua
		lea edx, msg2
		call writestring
		mov eax, count
		call writedec
		lea edx, msg3
		call writestring
		jmp Thoat

	; Error
	Error:
		lea edx, msg4
		call writestring
		jmp Thoat
	
	Thoat:	
		call crlf
		exit

	main endp

	WordCount proc
		push ecx
		push esi

	; kiem tra tung ki tu
	L1:
		cmp ecx, 0
		jz Return
		mov al, [esi]
		cmp al, 32		; dau cach
		je EndWord		
		cmp al, 9			; dau tab
		je EndWord
		cmp al, 10		; dau xuong dong
		je EndWord
	
	; chuyen sang ki tu tiep theo
	Next:
		inc esi
		dec ecx
		jmp L1

	; het 1 word, tang count	
	EndWord:
		inc count
		jmp Next
	
	; tra ve ket qua
	Return:
		pop esi
		pop ecx
		ret
	WordCount endp

end main