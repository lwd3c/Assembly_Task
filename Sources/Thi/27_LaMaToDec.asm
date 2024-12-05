include Irvine32.inc

; chuyen doi so he La Ma sang so 10

.data
	array BYTE 256 DUP(?)
	numArray DWORD 256 DUP (?)
	leng DWORD ?
	sum DWORD 0
	tb BYTE "Nhap vao so La Ma (chi chua I, V, X, L, C, D, M): ", 0
	tb1 BYTE "So La Ma vua nhap la: ", 0
	tb2 BYTE "Gia tri thap phan cua so La Ma: ", 0 
	tb3 BYTE "Ki tu dau vao khong hop le !", 0

.code
	main proc
	; nhap vao so La Ma
		lea edx, tb
		call writestring
		lea edx, array
		mov ecx, 256
		call readString
		mov leng, eax
		
	; in so vua nhap
		lea edx, tb1
		call writestring
		lea edx, array
		call writestring
	
	; tinh gia tri thap phan moi ki tu La Ma
		lea esi, array				; mang array luu gia tri ban dau
		lea edi, numArray			; mang numArray luu ket qua
		call EachValue

	; in gia tri thap phan cua so La Ma
		lea edx, tb2
		call writestring
		lea edi, numArray
		call SumValue
		
		call crlf
		exit
	main endp

	EachValue proc
		mov ecx, leng				; ecx = chieu dai mang
	L1:
		cmp ecx, 0				; neu ecx = 0 thi in ra ket qua
		je Thoat
		mov al, [esi]				; so sanh tung phan tu voi tung ki tu La Ma
		cmp al, "I"
		je case1
		cmp al, "V"
		je case2
		cmp al, "X"
		je case3
		cmp al, "L"
		je case4
		cmp al, "C"
		je case5
		cmp al, "D"
		je case6
		cmp al, "M"
		je case7
		call crlf
		lea edx, tb3				; neu khac cac ki tu La Ma -> hien thi loi va thoat chuong trinh
		call writestring
		exit
	Next:
		mov [edi], eax				; luu vao mang ket qua
		dec ecx					
		add esi, TYPE array			; tro toi phan tu tiep theo
		add edi, TYPE numArray
		jmp L1

	case1:						; luu cac gia tri thap phan cua so La Ma tuong ung vao eax
		mov eax, 1
		jmp Next
	case2:
		mov eax, 5
		jmp Next
	case3:
		mov eax, 10
		jmp Next
	case4:
		mov eax, 50
		jmp Next
	case5:
		mov eax, 100
		jmp Next
	case6:
		mov eax, 500
		jmp Next
	case7:
		mov eax, 1000
		jmp Next
	
	Thoat:
		call crlf
		ret
	EachValue endp

	SumValue proc
		mov esi, leng
		dec esi
		mov eax, [edi + esi * 4]			; luu gia tri cuoi cung vao sum
		mov sum, eax
	L3:
		dec esi	
		cmp esi, 0					; neu chay het mang thi in ket qua
		jl Ketqua

		mov ebx, [edi + esi * 4]			; phan tu hien tai
		mov edx, [edi + esi * 4 + 4]		; phan tu ke tiep

		cmp ebx, edx					; so sanh 2 phan tu ke tiep, neu nho hon thi thuc hien phep tru
		jl Subtract
		add sum, ebx					; nguoc lai, thuc hien phep cong					
		jmp L3
		
	Subtract:
		sub sum, ebx
		jmp L3

	Ketqua:
		mov eax, sum					; in ra ket qua
		call writedec

		ret
	SumValue endp

end main
