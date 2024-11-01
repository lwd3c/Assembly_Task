include Irvine32.inc

; chuyen doi Dec to Hex

.data
	msg BYTE "Nhap so DEC: ", 0
	msg2 BYTE "DEC to HEX: 0x", 0
	Hexnum DWORD 50 DUP(?)
	Decnum DWORD ?
	i DWORD 0

.code
	main proc
	; nhap so DEC
		lea edx, msg
		call writestring
		call readdec
		mov Decnum, eax
	; convert Dec to Hex
		lea esi, Hexnum
	Convert:
		mov eax, Decnum
		cmp eax, 0
		jz Print
		mov ebx, 16
		cdq
		div ebx
		mov Decnum, eax
	; chuyen doi so tu 10-16 thanh A-F
		cmp edx, 10
		je caseA
		cmp edx, 11
		je caseB
		cmp edx, 12
		je caseC
		cmp edx, 13
		je caseD
		cmp edx, 14
		je caseE
		cmp edx, 15
		je caseF
		mov [esi], edx

	Next:
		add esi, TYPE Hexnum
		inc i
		jmp Convert

	caseA:
		mov al, 'A'
		mov [esi], al
		jmp Next
	caseB:
		mov al, 'B'
		mov [esi], al
		jmp Next
	caseC:
		mov al, 'C'
		mov [esi], al
		jmp Next
	caseD:
		mov al, 'D'
		mov [esi], al
		jmp Next
	caseE:
		mov al, 'E'
		mov [esi], al
		jmp Next
	caseF:
		mov al, 'F'
		mov [esi], al
		jmp Next

	Print:
		lea edx, msg2
		call writeString
	; in tu cuoi mang len dau
		mov eax, i
		dec eax
		mov ebx, TYPE Hexnum
		mul ebx
		lea esi, Hexnum
		add esi, eax			; dua esi tro toi cuoi mang
		L1:	
			cmp i, 0
			jz Thoat
			mov eax, [esi]
			cmp eax, 10
			jg Char_print
			call writeDec

		Next_Print:
			sub esi, TYPE Hexnum
			dec i
			jmp L1

		Char_print:
			call writeChar
			jmp Next_Print

	Thoat:
		call crlf
		exit
	main endp
end main
