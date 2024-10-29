; Tim gia tri khac 0 dau tien trong mang
include Irvine32.inc

.data
	array SWORD 50 DUP(0)
	;array SWORD 0,0,0,0,0,-5
	sentinel SWORD 0FFFFh
	tb BYTE "Nhap do dai mang: ", 0
	tb2 BYTE "Nhap phan tu thu ", 0
	msg BYTE "Gia tri khac 0 dau tien cua mang la: ", 0
	msg2 BYTE "Khong tim thay gia tri nao khac 0, ESI -> ", 0

.code
	main proc
		call input
		mov ecx, LENGTHOF array
		lea esi, array
	L1:	
		cmp WORD PTR [esi], 0
		jnz display
		add esi, TYPE array
		dec ecx
		jnz L1
	; khong co so khac 0
		lea edx, msg2
		call writestring
		lea esi, sentinel
		movzx eax, WORD PTR [esi]
		call writeHex
		jmp quit
	; co so khac 0
	display:
		lea edx, msg
		call writestring
		movsx eax, WORD PTR [esi]
		call writeInt
	quit:
		exit
	main endp

	input proc
	; nhap do dai mang
		lea edx, tb
		call writestring
		call readDec
		mov ecx, eax
	; nhap tung phan tu cua mang
		lea esi, array
		mov edi, 1
	L1:
		lea edx, tb2
		call writestring
		mov eax, edi
		call writeDec
		mov ax, ':'
		call writeChar
		mov ax, ' '
		call writeChar
		call readInt
		mov [esi], eax
		add esi, TYPE array
		dec ecx
		inc edi
		cmp ecx, 0
		jnz L1
		ret
	input endp
end main