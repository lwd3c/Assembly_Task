INCLUDE Irvine32.inc

.data
	arr1 BYTE "Nhap vao 1 chuoi in thuong: ", 0
	arr2 BYTE "Chuoi in hoa la: ", 0
	chuoi BYTE 256 DUP(?)

.code
main proc
	
	lea edx,  arr1
	call writeString
	
	mov ecx, 256
	lea edx,  chuoi
	call readString

	mov ecx, eax

	lea edx,  arr2
	call writeString
	lea esi, chuoi
	L1:
		mov al, [esi]
		cmp al, ' '
		jz NEXT
		sub al, 20h
	NEXT:
		call writeChar
		add esi, TYPE chuoi
	loop L1
	
	exit
	
main endp
end main