include Irvine32.inc

; xac dinh so word co trong 1 doan van

.data
	msg BYTE "Nhap doan van ban tieng anh can xac dinh (toi da 254 ki tu): ", 0
	msg2 BYTE "Co tat ca ", 0
	msg3 BYTE " word trong van ban !", 0
	msg4 BYTE "Kich thuoc van ban vuot qua do dai cho phep ! Vui long nhap lai.", 0 
	paragh BYTE 256 DUP(?)
	leng DWORD ?
	count DWORD 1
	isWord DWORD 0

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

		mov count, 0
		mov isWord, 0

	; kiem tra tung ki tu
	L1:
		cmp ecx, 0
		jz Return
		mov al, [esi]

	; A - Z
		cmp al, 'A'		
		jl EndWord		
		cmp al, 'Z'		
		jle ValidChar

	; a - z
		cmp al, 'a'		
		jl EndWord		
		cmp al, 'z'		
		jle ValidChar

	; 0 - 9
		cmp al, '0'		
		jl EndWord		
		cmp al, '9'		
		jle ValidChar

		jmp EndWord

	; ki tu hop le
	ValidChar:
		cmp isWord, 1			; kiem tra xem co dang trong 1 tu hay khong
		je Next
		mov isWord, 1			; neu trong 1 tu, bat dau tu moi
		inc count

	; chuyen sang ki tu tiep theo
	Next:
		inc esi
		dec ecx
		jmp L1

	; het 1 word, tang count	
	EndWord:
		mov isWord, 0
		inc esi
		dec ecx
		jmp L1
	
	; tra ve ket qua
	Return:
		pop esi
		pop ecx
		ret
	WordCount endp

end main