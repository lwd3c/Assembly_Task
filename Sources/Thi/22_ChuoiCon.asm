include Irvine32.inc

; tim kiem 1 chuoi con m ki tu trong xau n ki tu

.data
	msg BYTE "Nhap chuoi ban dau: ", 0
	msg1 BYTE "Nhap chuoi con can tim: ", 0
	msg3 BYTE "Tim thay chuoi con trong chuoi ban dau !", 0
	msg4 BYTE "Khong tim thay chuoi con trong chuoi ban dau !", 0
	string BYTE 200 DUP(?)
	sub_string BYTE 200 DUP(?)		
	leng1 DWORD ?			; n
	leng2 DWORD ?			; m

.code
	main proc
	; nhap chuoi ban dau
		lea edx, msg
		call writestring
		lea edx, string
		mov ecx, 200
		call readstring
		mov leng1, eax

	; nhap chuoi con
		lea edx, msg1
		call writestring
		lea edx, sub_string
		mov ecx, 200
		call readstring
		mov leng2, eax

	; goi ham searchString
		lea edi, string
		lea esi, sub_string
		call searchString

	; hien thi ket qua tim kiem
		cmp ebx, 0
		jz NotFound

	; Found
		lea edx, msg3
		call writeString
		jmp Thoat

	NotFound:
		lea edx, msg4
		call writeString

	Thoat:
		call crlf
		exit
	main endp

; ham tim kiem sub string
	searchString proc
		push esi
		push edi
		mov eax, 0			; vi tri ban dau
		mov ecx, leng1			

	; tu tung vi tri trong eax
	Next:
		push eax				; luu vi tri hien tai
		lea edi, string
		add edi, eax			; vi tri hien tai
		lea esi, sub_string		; tro ve vi tri ban dau chuoi con
		push ecx
		mov ecx, leng2			; vong lap chuoi con: m

		Check:
			cmp ecx, 0		; neu chay het chuoi con -> tim thay 
			jz End_Match

			mov al, [edi]		; ki tu dau tien 
			cmp al, [esi]		; so sanh voi ki tu dau tien chuoi con
			jne NoMatch		; neu khong khop, toi ki tu thu 2 cua chuoi ban dau
			
			inc edi
			inc esi
			dec ecx
			jmp Check

		; khong khop
		NoMatch:
			pop ecx			; lay lai gia tri vong lap ngoai
			pop eax			; lay lai gia tri vi tri hien tai
			inc eax			; tang len vi tri tiep theo
			dec ecx
			cmp ecx, 0		; neu het chuoi ban dau thi in ra ket qua tim kiem
			jnz Next			

			mov ebx, 0	
			jmp Return
					
		; tim thay chuoi con
		End_Match:	
			pop ecx
			pop eax
			mov ebx, 1

		Return:
			pop edi
			pop esi
			ret
	searchString endp

end main