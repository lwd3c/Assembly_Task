include Irvine32.inc

.data
	msg BYTE "20 chuoi ki tu ngau nhien la: ", 0
	count DWORD ?
	array BYTE 10 DUP(?)
	
.code
	main proc
	; in thong bao
		lea edx, msg
		call writestring
	; tao 20 chuoi random
		mov ecx, 20
		call Randomize
	Rand:
		lea esi, array
		mov count, ecx
		mov ecx, 10
		Rand2:
			call RandomChar
			mov [esi], al
			inc esi
			loop Rand2

		; in ra man hinh
			call crlf
			lea edx, array
			call writestring
			call reset
		mov ecx, count
		loop Rand
		exit
	main endp

	reset proc
		mov ecx, 10
		lea esi, array
	L1:	
		mov BYTE PTR [esi], 0
		inc esi
		loop L1
		ret
	reset endp

	RandomChar proc
		mov ebx, 65	; A
		mov eax, 91	; Z + 1
		sub eax, ebx		
		call RandomRange
		add eax, ebx	
		ret
	RandomChar endp
end main
