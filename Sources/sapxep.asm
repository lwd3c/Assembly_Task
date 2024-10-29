include Irvine32.inc

.data
	array DWORD 1,2,3,4,5,6

.code
main proc
	; 1,2,3,4
	; 4,3,2,1
	;mov  eax, [array]		;eax = 1
	;xchg eax, [array+12]	;1,2,3,1 eax = 4
	;xchg eax, [array]		;4,2,3,1 eax = 1
	;mov  eax, [array+4]	;eax = 2
	;xchg eax, [array+8]	;4,2,2,1 eax = 3
	;xchg eax, [array+4]	;4,3,2,1 eax = 2

	;6,5,4,3,2,1
	mov  eax, [array]		;eax = 1
	xchg eax, [array+20]	;1,2,3,4,5,1 eax = 6
	xchg eax, [array]		;6,2,3,4,5,1 eax = 1
	mov  eax, [array+4]		;eax = 2
	xchg eax, [array+16]	;6,2,3,4,2,1 eax = 5
	xchg eax ,[array+4]		;6,5,3,4,2,1 eax = 2
	mov  eax, [array+8]		;eax = 3
	xchg eax,[array+12]		;6,5,3,3,2,1 eax = 4
	xchg eax, [array+8]		;6,5,4,3,2,1 eax = 3

	mov ecx, 6
	lea esi, array 
	L1:
		mov eax, [esi]
		call writeDec

		mov al, ' '
		call writeChar

		add esi, 4
		loop L1

	exit

main endp
end main