include Irvine32.inc

.data
	msg BYTE "Nhap so nguyen M: ", 0
	msg2 BYTE "Nhap so nguyen N: ", 0
	msg3 BYTE "So ngau nhien trong khoang M - N la: ", 0
	lower SDWORD ?
	higher SDWORD ?
	randnumber SDWORD ?
	
.code
	main proc
	; nhap M
		lea edx, msg
		call writestring
		call readInt
		mov lower, eax
	; nhap N
		lea edx, msg2
		call writestring
		call readInt
		mov higher, eax
	; so ngau nhien
		mov ebx, lower 
		mov eax, higher 
		call BetterRandomRange
	; in so ngau nhien
		lea edx, msg3
		call writestring
		mov eax, randnumber
		call writeInt
		exit
	main endp

	BetterRandomRange proc
		call Randomize 
		sub eax, ebx		; lay khoang random
		call RandomRange
		add eax, ebx	
		mov randnumber, eax
		ret
	BetterRandomRange endp

end main