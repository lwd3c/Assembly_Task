include Irvine32.inc

.data
	array1 DWORD 256 DUP(?)
	array2 DWORD 256 DUP(?)
	n DWORD ?
	min DWORD ?
	max DWORD ?
	msg BYTE "Nhap so luong phan tu mang: ", 0
	msg1 BYTE "    Nhap phan tu thu ", 0
	msg2 BYTE "Nhap mang a1: ", 0
	msg3 BYTE "Nhap mang a2: ", 0
	msg4 BYTE "Mang a1: ", 0
	msg5 BYTE "Mang a2: ", 0
	msg6 BYTE "Min: ", 0
	msg7 BYTE "Max: ", 0
	msg8 BYTE "Ket qua: a1 < a2", 0
	msg9 BYTE "Ket qua: a1 > a2", 0
	msg10 BYTE "Ket qua: Khong the so sanh 2 mang !", 0

.code
	main proc
	; nhap so luong phan tu
		lea edx, msg
		call writestring
		call readdec
		mov n, eax

	; nhap mang a1
		lea edx, msg2
		call writestring
		call crlf
		lea edi, array1
		call input

	; nhap mang a2
		lea edx, msg3
		call writestring
		call crlf
		lea edi, array2
		call input

	; in mang a1	
		lea edx, msg4
		call writestring
		lea edi, array1
		call output
	; in min, max array1
		lea edi, array1
		call FindMinMax
		mov max, ebx
		mov min, esi
		call crlf

	; in mang a2
		lea edx, msg5
		call writestring
		lea edi, array2
		call output
	; in min, max array2
		lea edi, array2
		call FindMinMax
		call crlf
	; So sanh 2 mang
		cmp min, esi
		jl Result1
		cmp max, ebx
		jg Result2
		lea edx, msg10
		call writestring
		jmp Thoat

	Result1:
		lea edx, msg8
		call writestring
		jmp Thoat

	Result2:
		lea edx, msg9
		call writestring
	Thoat:
		exit
	main endp

; ham nhap cac phan tu mang 
	input proc
		mov ecx, n
		mov esi, 1
	L1:
		lea edx, msg1
		call writestring
		mov eax, esi
		call writedec
		mov al, ':'
		call writechar
		mov al, ' '
		call writechar
		call readDec
		mov [edi], eax
		add edi, TYPE array1
		inc esi
		loop L1
		call crlf
		ret
	input endp

; ham in mang ra man hinh
	output proc
		mov ecx, n
	L2:
		mov eax, [edi]
		call writedec
		add edi, TYPE array1
		mov al, ' '
		call writechar
		loop L2
		call crlf
		ret
	output endp

; ham tim max min
	FindMinMax proc
		mov ecx, n		; n la so luong phan tu mang
		mov eax, [edi]		; gia tri dau tien
		mov ebx, eax		; max
		mov esi, eax		; min
	L3:
		dec ecx
		cmp ecx, 0			; neu het phan tu thi thoat
		je Ketqua
		add edi, TYPE array1	; tang len phan tu tiep theo
		cmp [edi], ebx			; so sanh phan tu tiep theo voi eax
		jg Great
		cmp [edi], esi
		jl Small
		jmp L3

	Great:
		mov ebx, [edi]
		jmp L3	

	Small:
		mov esi, [edi]
		jmp L3

	Ketqua:
		lea edx, msg7
		call writestring
		mov eax, ebx
		call writedec
		call crlf
		lea edx, msg6
		call writestring
		mov eax, esi
		call writedec

		ret
	FindMinMax endp

end main