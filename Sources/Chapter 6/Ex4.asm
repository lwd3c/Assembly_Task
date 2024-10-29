INCLUDE Irvine32.inc

.data
	a1 BYTE "Nhap vao so so hang cua day: ", 0
	a2 BYTE "Nhap day so: ", 0
	a3 BYTE "So hang lon nhat cua day la: ", 0
	snum DWORD 50 DUP(?)
	inx DWORD ?
	max DWORD ?
	index DWORD ?
	
.code
main proc
	
	mov edx, offset a1
	call writeString
	call readDec

	mov inx, eax
	mov ecx, eax
	mov edx, offset a2
	call writeString
	
	mov esi, offset snum
	L1:
		call readDec
		mov [esi], eax
		add esi, TYPE index
	loop L1

	mov ecx, inx
	mov eax, [esi]
	MAX_1: 
		cmp eax, [esi]
		jge NEXT_1
		mov eax, [esi]
		NEXT_1: 
		sub esi, TYPE index
	loop MAX_1

	mov ecx, inx
	mov index, ecx
	dec inx
	dec ecx
	SX1:
		lea esi, snum
		SX2:
		mov edx, TYPE snum
			mov ebx, [esi]
			mov eax, [esi + edx]
			cmp ebx, eax
			jle NEXT_2
			mov [esi], ebx
			mov [esi + edx], eax
		NEXT_2:
			add esi, TYPE snum
		loop SX2
		dec inx
		mov ecx, inx
	loop SX1
	
	mov ecx, index
	mov esi, offset snum
	L2:
		mov eax, [esi]
		call writeDec
		add esi, TYPE index
	loop L2

	exit
	
main endp
end main