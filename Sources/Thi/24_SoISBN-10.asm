include Irvine32.inc

; kiem tra 1 chuoi nhap vao co dung la so ISBN-10

.data
	msg BYTE "Nhap chuoi ban dau: ", 0
	msg2 BYTE "Chuoi nhap vao la so ISBN-10 !", 0
	msg3 BYTE "Chuoi nhap vao khong la so ISBN-10 !", 0
	msg4 BYTE "Chuoi nhap vao khong dung dinh dang so ISBN-10 !", 0
	string BYTE 12 DUP(?)
	leng DWORD ?
	sum DWORD 0

.code
	main proc 
	; nhap chuoi ban dau
		lea edx, msg
		call writestring
		lea edx, string    
		mov ecx, 12
		call readstring
		mov leng, eax
		cmp eax, 10			; kiem tra do dai 10 ki tu
		jne Error
			
	; kiem tra dinh dang 
		mov ebx, 9			; vong lap ngoai chay het 9 ki tu dau
		mov ecx, 39h			; vong lap trong so sanh tung ki tu voi 0-9
		lea edi, string
	L1:
		push ecx
		cmp ebx, 0
		jz LastDigit
		mov al, [edi]
		L2:
			cmp al, cl
			jne NextCompare		; neu trung
			inc edi
			pop ecx
			dec ebx
			jmp L1

		NextCompare:
			dec ecx
			cmp ecx, 30h
			jl Error
			jmp L2
		
	;  ki tu cuoi co the la 0-9, X
	LastDigit:
		mov ecx, 39h
		mov al, [edi]				
		cmp al, 'X'
		je CheckSum
	L3:
		cmp al, cl
		je CheckSum
		dec ecx
		cmp ecx, 30h
		jl Error
		jmp L3

	; tinh toan chu so kiem tra
	CheckSum:
		xor eax, eax
		mov ecx, leng
		lea edi, string
		Sum_action:
			cmp ecx, 0
			jz Mod_action
			mov al, [edi]
			cmp al, 'X'
			je X_sub
			sub al, 30h
		Next_sum:
			mul ecx
			add sum, eax
			inc edi
			dec ecx
			jmp Sum_action

		X_sub:
			sub al, 4Eh
			jmp Next_sum

	; loi sai dinh dang
	Error:
		lea edx, msg4
		call writestring
		jmp Thoat
	
	; tinh mod 
	Mod_action:
		mov eax, sum
		mov ebx, 11
		cdq
		div ebx
		cmp edx, 0
		jnz Invalid
		lea edx, msg2
		call writestring
		jmp Thoat

	; khong la so ISBN-10
	Invalid:
		lea edx, msg3
		call writestring
		
	Thoat:
		call crlf
		exit

	main endp
end main