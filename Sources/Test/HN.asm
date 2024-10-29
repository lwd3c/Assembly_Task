INCLUDE Irvine32.inc

.386

.stack 100h

.data
	a1 BYTE "Nhap vao day so la ma: ", 0
	a2 BYTE 13, 10, 0
	a3 BYTE '-'
	a4 BYTE "Gia tri day so la ma: ", 0
	snum BYTE "XXIII", 0
	arr1 BYTE 'I', 'V', 'X', 'L', 'C', 'D', 'M', 0
	arr2 WORD 1d, 5d, 10d, 50d, 100d, 500d, 1000d


.code
main proc

	mov esi, offset snum

	DOC_GT:
	mov ebx, 0
	L1:
	mov cl, [esi]
	cmp cl, [arr1+ebx]
	jz GT_1
	inc ebx
	jmp L1
	GT_1:
	mov al, [arr1 + ebx]
	call writeChar
	mov al, a3
	call writeChar
	xor eax, eax
	mov ax, [arr2 +2*ebx]
	call writeDec
	mov edx, offset a2
	call writeString
	inc esi
	mov cl, [esi]
	cmp cl,0
	jnz DOC_GT

	mov eax, 0
	TINH_GT:
	mov ebx, 0
	mov esi, offset snum
	cmp [esi], ebx
	jz CONTINUE
	inc esi
	jmp TINH_GT

	CONTINUE:
	mov ebx, 0
	L2:
	mov cl, [esi]
	cmp cl, [arr1+ebx]
	jz GT_2
	inc ebx
	jmp L2
	GT_2:
	add ax, [arr2 + 2*ebx]
	dec esi
	mov cl, [esi]
	cmp cl, [snum]
	jnz CONTINUE

	mov edx, offset a2
	call writeString
	mov edx, offset a4
	call writeString


	exit
	
main endp
end main