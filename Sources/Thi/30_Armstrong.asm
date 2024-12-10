include Irvine32.inc

; kiem tra so Armstrong: so ma tong cac luy thua cua cac chu so cua no bang chinh no
; 0, 1, 153, 370, 371, 407, 1634, 8208, 9474,...

.data
	msg BYTE "Nhap so bat ki: ", 0
	msg2 BYTE "So vua nhap la so Armstrong !", 0
	msg3 BYTE "So vua nhap khong la so Armstrong !", 0
	number DWORD ?
	numArr DWORD 10 DUP(?)
	n DWORD 0
	sum DWORD 0

.code
	main proc
	; nhap so bat ki
		lea edx, msg
		call writestring
		call readdec
		mov number, eax
	
	; tinh so luong chu so
		lea esi, numArr
		call Digit

	; tinh luy thua tung chu so
		mov ecx, n
		lea esi, numArr
	L1:
		cmp ecx, 0
		jz SumValue
		mov eax, [esi]
		call LuyThua
		mov [esi], eax
		add esi, TYPE numArr
		dec ecx
		jmp L1
	
	; tong cac luy thua
	SumValue:
		mov ecx, n
		lea esi, numArr
	L2:
		cmp ecx, 0
		jz Compare
		mov eax, [esi]
		add sum, eax
		add esi, TYPE numArr
		dec ecx
		jmp L2
	
	; so sanh tong voi gia tri ban dau
	Compare:
		mov eax, sum 
		mov ebx, number
		cmp eax, ebx
		jne KhongLaSoArmstrong
		lea edx, msg2
		call writeString
		jmp Thoat

	KhongLaSoArmstrong:
		lea edx, msg3
		call writeString
	
	Thoat:
		call crlf
		exit
	main endp

; ham tinh so luong chu so
	Digit proc
	L1:
		cmp eax, 0
		jz Return
		mov ebx, 10
		cdq
		div ebx
		mov [esi], edx
		add esi, TYPE numArr
		inc n
		jmp L1
	Return:
		ret
	Digit endp

; ham tinh luy thua tung chu so
	LuyThua proc
		push ecx
		mov ecx, n
		dec ecx
		mov ebx, eax
	L1:	
		cmp ecx, 0
		jz Return
		mul ebx
		dec ecx
		jmp L1
	Return:
		pop ecx	
		ret
	LuyThua endp

end main